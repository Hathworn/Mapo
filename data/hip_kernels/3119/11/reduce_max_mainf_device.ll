; ModuleID = '../data/hip_kernels/3119/11/main.cu'
source_filename = "../data/hip_kernels/3119/11/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ16reduce_max_mainfPfS_PijiE5sdata = internal addrspace(3) global [256 x float] undef, align 16
@_ZZ16reduce_max_mainfPfS_PijiE7idxData = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16reduce_max_mainfPfS_Piji(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = mul i32 %7, %4
  %9 = add i32 %8, %6
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !5
  %14 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !14, !invariant.load !15
  %17 = zext i16 %16 to i32
  %18 = udiv i32 %13, %17
  %19 = mul i32 %18, %17
  %20 = icmp ugt i32 %13, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %4
  %24 = icmp ult i32 %9, %3
  br i1 %24, label %25, label %49

25:                                               ; preds = %5, %44
  %26 = phi i32 [ %47, %44 ], [ %9, %5 ]
  %27 = phi float [ %46, %44 ], [ 0.000000e+00, %5 ]
  %28 = phi i32 [ %45, %44 ], [ undef, %5 ]
  %29 = zext i32 %26 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  %31 = load float, float addrspace(1)* %30, align 4, !tbaa !16, !amdgpu.noclobber !15
  %32 = fcmp contract olt float %27, %31
  %33 = select i1 %32, i32 %26, i32 %28
  %34 = select i1 %32, float %31, float %27
  %35 = add i32 %26, %4
  %36 = icmp ult i32 %35, %3
  br i1 %36, label %37, label %44

37:                                               ; preds = %25
  %38 = zext i32 %35 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %0, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !16, !amdgpu.noclobber !15
  %41 = fcmp contract olt float %34, %40
  %42 = select i1 %41, i32 %35, i32 %33
  %43 = select i1 %41, float %40, float %34
  br label %44

44:                                               ; preds = %37, %25
  %45 = phi i32 [ %33, %25 ], [ %42, %37 ]
  %46 = phi float [ %34, %25 ], [ %43, %37 ]
  %47 = add i32 %26, %23
  %48 = icmp ult i32 %47, %3
  br i1 %48, label %25, label %49, !llvm.loop !20

49:                                               ; preds = %44, %5
  %50 = phi i32 [ undef, %5 ], [ %45, %44 ]
  %51 = phi float [ 0.000000e+00, %5 ], [ %46, %44 ]
  %52 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %6
  store float %51, float addrspace(3)* %52, align 4, !tbaa !16
  %53 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %6
  store i32 %50, i32 addrspace(3)* %53, align 4, !tbaa !22
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp sgt i32 %4, 511
  br i1 %54, label %55, label %67

55:                                               ; preds = %49
  %56 = icmp ult i32 %6, 256
  br i1 %56, label %57, label %65

57:                                               ; preds = %55
  %58 = add nuw nsw i32 %6, 256
  %59 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %58
  %60 = load float, float addrspace(3)* %59, align 4, !tbaa !16
  %61 = fcmp contract olt float %51, %60
  br i1 %61, label %62, label %65

62:                                               ; preds = %57
  store float %60, float addrspace(3)* %52, align 4, !tbaa !16
  %63 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %58
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !22
  store i32 %64, i32 addrspace(3)* %53, align 4, !tbaa !22
  br label %65

65:                                               ; preds = %57, %62, %55
  %66 = phi float [ %60, %62 ], [ %51, %57 ], [ %51, %55 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %67

67:                                               ; preds = %65, %49
  %68 = phi float [ %66, %65 ], [ %51, %49 ]
  %69 = icmp sgt i32 %4, 255
  br i1 %69, label %70, label %82

70:                                               ; preds = %67
  %71 = icmp ult i32 %6, 128
  br i1 %71, label %72, label %80

72:                                               ; preds = %70
  %73 = add nuw nsw i32 %6, 128
  %74 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %73
  %75 = load float, float addrspace(3)* %74, align 4, !tbaa !16
  %76 = fcmp contract olt float %68, %75
  br i1 %76, label %77, label %80

77:                                               ; preds = %72
  store float %75, float addrspace(3)* %52, align 4, !tbaa !16
  %78 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %73
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !22
  store i32 %79, i32 addrspace(3)* %53, align 4, !tbaa !22
  br label %80

80:                                               ; preds = %72, %77, %70
  %81 = phi float [ %75, %77 ], [ %68, %72 ], [ %68, %70 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %82

82:                                               ; preds = %80, %67
  %83 = phi float [ %81, %80 ], [ %68, %67 ]
  %84 = icmp sgt i32 %4, 127
  br i1 %84, label %85, label %97

85:                                               ; preds = %82
  %86 = icmp ult i32 %6, 64
  br i1 %86, label %87, label %95

87:                                               ; preds = %85
  %88 = add nuw nsw i32 %6, 64
  %89 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %88
  %90 = load float, float addrspace(3)* %89, align 4, !tbaa !16
  %91 = fcmp contract olt float %83, %90
  br i1 %91, label %92, label %95

92:                                               ; preds = %87
  store float %90, float addrspace(3)* %52, align 4, !tbaa !16
  %93 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %88
  %94 = load i32, i32 addrspace(3)* %93, align 4, !tbaa !22
  store i32 %94, i32 addrspace(3)* %53, align 4, !tbaa !22
  br label %95

95:                                               ; preds = %87, %92, %85
  %96 = phi float [ %90, %92 ], [ %83, %87 ], [ %83, %85 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %97

97:                                               ; preds = %95, %82
  %98 = phi float [ %96, %95 ], [ %83, %82 ]
  %99 = icmp ult i32 %6, 32
  br i1 %99, label %100, label %196

100:                                              ; preds = %97
  %101 = icmp sgt i32 %4, 63
  br i1 %101, label %102, label %115

102:                                              ; preds = %100
  %103 = add nuw nsw i32 %6, 32
  %104 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %103
  %105 = addrspacecast float addrspace(3)* %104 to float*
  %106 = load volatile float, float* %105, align 4, !tbaa !16
  %107 = fcmp contract olt float %98, %106
  br i1 %107, label %108, label %115

108:                                              ; preds = %102
  %109 = load volatile float, float* %105, align 4, !tbaa !16
  %110 = addrspacecast float addrspace(3)* %52 to float*
  store volatile float %109, float* %110, align 4, !tbaa !16
  %111 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %103
  %112 = addrspacecast i32 addrspace(3)* %111 to i32*
  %113 = load volatile i32, i32* %112, align 4, !tbaa !22
  %114 = addrspacecast i32 addrspace(3)* %53 to i32*
  store volatile i32 %113, i32* %114, align 4, !tbaa !22
  br label %115

115:                                              ; preds = %102, %108, %100
  %116 = phi float [ %109, %108 ], [ %98, %102 ], [ %98, %100 ]
  %117 = icmp sgt i32 %4, 31
  br i1 %117, label %118, label %131

118:                                              ; preds = %115
  %119 = add nuw nsw i32 %6, 16
  %120 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %119
  %121 = addrspacecast float addrspace(3)* %120 to float*
  %122 = load volatile float, float* %121, align 4, !tbaa !16
  %123 = fcmp contract olt float %116, %122
  br i1 %123, label %124, label %131

124:                                              ; preds = %118
  %125 = load volatile float, float* %121, align 4, !tbaa !16
  %126 = addrspacecast float addrspace(3)* %52 to float*
  store volatile float %125, float* %126, align 4, !tbaa !16
  %127 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %119
  %128 = addrspacecast i32 addrspace(3)* %127 to i32*
  %129 = load volatile i32, i32* %128, align 4, !tbaa !22
  %130 = addrspacecast i32 addrspace(3)* %53 to i32*
  store volatile i32 %129, i32* %130, align 4, !tbaa !22
  br label %131

131:                                              ; preds = %118, %124, %115
  %132 = phi float [ %125, %124 ], [ %116, %118 ], [ %116, %115 ]
  %133 = icmp sgt i32 %4, 15
  br i1 %133, label %134, label %147

134:                                              ; preds = %131
  %135 = add nuw nsw i32 %6, 8
  %136 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %135
  %137 = addrspacecast float addrspace(3)* %136 to float*
  %138 = load volatile float, float* %137, align 4, !tbaa !16
  %139 = fcmp contract olt float %132, %138
  br i1 %139, label %140, label %147

140:                                              ; preds = %134
  %141 = load volatile float, float* %137, align 4, !tbaa !16
  %142 = addrspacecast float addrspace(3)* %52 to float*
  store volatile float %141, float* %142, align 4, !tbaa !16
  %143 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %135
  %144 = addrspacecast i32 addrspace(3)* %143 to i32*
  %145 = load volatile i32, i32* %144, align 4, !tbaa !22
  %146 = addrspacecast i32 addrspace(3)* %53 to i32*
  store volatile i32 %145, i32* %146, align 4, !tbaa !22
  br label %147

147:                                              ; preds = %134, %140, %131
  %148 = phi float [ %141, %140 ], [ %132, %134 ], [ %132, %131 ]
  %149 = icmp sgt i32 %4, 7
  br i1 %149, label %150, label %163

150:                                              ; preds = %147
  %151 = add nuw nsw i32 %6, 4
  %152 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %151
  %153 = addrspacecast float addrspace(3)* %152 to float*
  %154 = load volatile float, float* %153, align 4, !tbaa !16
  %155 = fcmp contract olt float %148, %154
  br i1 %155, label %156, label %163

156:                                              ; preds = %150
  %157 = load volatile float, float* %153, align 4, !tbaa !16
  %158 = addrspacecast float addrspace(3)* %52 to float*
  store volatile float %157, float* %158, align 4, !tbaa !16
  %159 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %151
  %160 = addrspacecast i32 addrspace(3)* %159 to i32*
  %161 = load volatile i32, i32* %160, align 4, !tbaa !22
  %162 = addrspacecast i32 addrspace(3)* %53 to i32*
  store volatile i32 %161, i32* %162, align 4, !tbaa !22
  br label %163

163:                                              ; preds = %150, %156, %147
  %164 = phi float [ %157, %156 ], [ %148, %150 ], [ %148, %147 ]
  %165 = icmp sgt i32 %4, 3
  br i1 %165, label %166, label %179

166:                                              ; preds = %163
  %167 = add nuw nsw i32 %6, 2
  %168 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %167
  %169 = addrspacecast float addrspace(3)* %168 to float*
  %170 = load volatile float, float* %169, align 4, !tbaa !16
  %171 = fcmp contract olt float %164, %170
  br i1 %171, label %172, label %179

172:                                              ; preds = %166
  %173 = load volatile float, float* %169, align 4, !tbaa !16
  %174 = addrspacecast float addrspace(3)* %52 to float*
  store volatile float %173, float* %174, align 4, !tbaa !16
  %175 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %167
  %176 = addrspacecast i32 addrspace(3)* %175 to i32*
  %177 = load volatile i32, i32* %176, align 4, !tbaa !22
  %178 = addrspacecast i32 addrspace(3)* %53 to i32*
  store volatile i32 %177, i32* %178, align 4, !tbaa !22
  br label %179

179:                                              ; preds = %166, %172, %163
  %180 = phi float [ %173, %172 ], [ %164, %166 ], [ %164, %163 ]
  %181 = icmp sgt i32 %4, 1
  br i1 %181, label %182, label %195

182:                                              ; preds = %179
  %183 = add nuw nsw i32 %6, 1
  %184 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 %183
  %185 = addrspacecast float addrspace(3)* %184 to float*
  %186 = load volatile float, float* %185, align 4, !tbaa !16
  %187 = fcmp contract olt float %180, %186
  br i1 %187, label %188, label %195

188:                                              ; preds = %182
  %189 = load volatile float, float* %185, align 4, !tbaa !16
  %190 = addrspacecast float addrspace(3)* %52 to float*
  store volatile float %189, float* %190, align 4, !tbaa !16
  %191 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 %183
  %192 = addrspacecast i32 addrspace(3)* %191 to i32*
  %193 = load volatile i32, i32* %192, align 4, !tbaa !22
  %194 = addrspacecast i32 addrspace(3)* %53 to i32*
  store volatile i32 %193, i32* %194, align 4, !tbaa !22
  br label %195

195:                                              ; preds = %182, %188, %179
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %196

196:                                              ; preds = %195, %97
  %197 = icmp eq i32 %6, 0
  br i1 %197, label %198, label %204

198:                                              ; preds = %196
  %199 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE5sdata, i32 0, i32 0), align 16, !tbaa !16
  %200 = zext i32 %7 to i64
  %201 = getelementptr inbounds float, float addrspace(1)* %1, i64 %200
  store float %199, float addrspace(1)* %201, align 4, !tbaa !16
  %202 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ16reduce_max_mainfPfS_PijiE7idxData, i32 0, i32 0), align 16, !tbaa !22
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %200
  store i32 %202, i32 addrspace(1)* %203, align 4, !tbaa !22
  br label %204

204:                                              ; preds = %198, %196
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !10, i64 12}
!6 = !{!"hsa_kernel_dispatch_packet_s", !7, i64 0, !7, i64 2, !7, i64 4, !7, i64 6, !7, i64 8, !7, i64 10, !10, i64 12, !10, i64 16, !10, i64 20, !10, i64 24, !10, i64 28, !11, i64 32, !12, i64 40, !11, i64 48, !13, i64 56}
!7 = !{!"short", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!"int", !8, i64 0}
!11 = !{!"long", !8, i64 0}
!12 = !{!"any pointer", !8, i64 0}
!13 = !{!"hsa_signal_s", !11, i64 0}
!14 = !{i16 1, i16 1025}
!15 = !{}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !18, i64 0}

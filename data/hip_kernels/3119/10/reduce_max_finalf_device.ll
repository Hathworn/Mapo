; ModuleID = '../data/hip_kernels/3119/10/main.cu'
source_filename = "../data/hip_kernels/3119/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ17reduce_max_finalfPfS_PijiE5sdata = internal addrspace(3) global [256 x float] undef, align 16
@_ZZ17reduce_max_finalfPfS_PijiE7idxData = internal addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17reduce_max_finalfPfS_Piji(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = shl nsw i32 %4, 1
  %9 = mul i32 %8, %7
  %10 = add i32 %9, %6
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr inbounds i8, i8 addrspace(4)* %11, i64 12
  %13 = bitcast i8 addrspace(4)* %12 to i32 addrspace(4)*
  %14 = load i32, i32 addrspace(4)* %13, align 4, !tbaa !5
  %15 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !14, !invariant.load !15
  %18 = zext i16 %17 to i32
  %19 = udiv i32 %14, %18
  %20 = mul i32 %19, %18
  %21 = icmp ugt i32 %14, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %8
  %25 = icmp ult i32 %10, %3
  br i1 %25, label %26, label %55

26:                                               ; preds = %5, %50
  %27 = phi i32 [ %53, %50 ], [ %10, %5 ]
  %28 = phi float [ %52, %50 ], [ 0.000000e+00, %5 ]
  %29 = phi i32 [ %51, %50 ], [ undef, %5 ]
  %30 = zext i32 %27 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !16, !amdgpu.noclobber !15
  %33 = fcmp contract olt float %28, %32
  br i1 %33, label %34, label %37

34:                                               ; preds = %26
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %30
  %36 = load i32, i32 addrspace(1)* %35, align 4, !tbaa !20, !amdgpu.noclobber !15
  br label %37

37:                                               ; preds = %34, %26
  %38 = phi i32 [ %36, %34 ], [ %29, %26 ]
  %39 = phi float [ %32, %34 ], [ %28, %26 ]
  %40 = add i32 %27, %4
  %41 = icmp ult i32 %40, %3
  br i1 %41, label %42, label %50

42:                                               ; preds = %37
  %43 = zext i32 %40 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %0, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !16, !amdgpu.noclobber !15
  %46 = fcmp contract olt float %39, %45
  br i1 %46, label %47, label %50

47:                                               ; preds = %42
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !20, !amdgpu.noclobber !15
  br label %50

50:                                               ; preds = %42, %47, %37
  %51 = phi i32 [ %49, %47 ], [ %38, %42 ], [ %38, %37 ]
  %52 = phi float [ %45, %47 ], [ %39, %42 ], [ %39, %37 ]
  %53 = add i32 %27, %24
  %54 = icmp ult i32 %53, %3
  br i1 %54, label %26, label %55, !llvm.loop !22

55:                                               ; preds = %50, %5
  %56 = phi i32 [ undef, %5 ], [ %51, %50 ]
  %57 = phi float [ 0.000000e+00, %5 ], [ %52, %50 ]
  %58 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %6
  store float %57, float addrspace(3)* %58, align 4, !tbaa !16
  %59 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %6
  store i32 %56, i32 addrspace(3)* %59, align 4, !tbaa !20
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %60 = icmp sgt i32 %4, 511
  br i1 %60, label %61, label %73

61:                                               ; preds = %55
  %62 = icmp ult i32 %6, 256
  br i1 %62, label %63, label %71

63:                                               ; preds = %61
  %64 = add nuw nsw i32 %6, 256
  %65 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %64
  %66 = load float, float addrspace(3)* %65, align 4, !tbaa !16
  %67 = fcmp contract olt float %57, %66
  br i1 %67, label %68, label %71

68:                                               ; preds = %63
  store float %66, float addrspace(3)* %58, align 4, !tbaa !16
  %69 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %64
  %70 = load i32, i32 addrspace(3)* %69, align 4, !tbaa !20
  store i32 %70, i32 addrspace(3)* %59, align 4, !tbaa !20
  br label %71

71:                                               ; preds = %63, %68, %61
  %72 = phi float [ %66, %68 ], [ %57, %63 ], [ %57, %61 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %73

73:                                               ; preds = %71, %55
  %74 = phi float [ %72, %71 ], [ %57, %55 ]
  %75 = icmp sgt i32 %4, 255
  br i1 %75, label %76, label %88

76:                                               ; preds = %73
  %77 = icmp ult i32 %6, 128
  br i1 %77, label %78, label %86

78:                                               ; preds = %76
  %79 = add nuw nsw i32 %6, 128
  %80 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %79
  %81 = load float, float addrspace(3)* %80, align 4, !tbaa !16
  %82 = fcmp contract olt float %74, %81
  br i1 %82, label %83, label %86

83:                                               ; preds = %78
  store float %81, float addrspace(3)* %58, align 4, !tbaa !16
  %84 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %79
  %85 = load i32, i32 addrspace(3)* %84, align 4, !tbaa !20
  store i32 %85, i32 addrspace(3)* %59, align 4, !tbaa !20
  br label %86

86:                                               ; preds = %78, %83, %76
  %87 = phi float [ %81, %83 ], [ %74, %78 ], [ %74, %76 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %88

88:                                               ; preds = %86, %73
  %89 = phi float [ %87, %86 ], [ %74, %73 ]
  %90 = icmp sgt i32 %4, 127
  br i1 %90, label %91, label %103

91:                                               ; preds = %88
  %92 = icmp ult i32 %6, 64
  br i1 %92, label %93, label %101

93:                                               ; preds = %91
  %94 = add nuw nsw i32 %6, 64
  %95 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %94
  %96 = load float, float addrspace(3)* %95, align 4, !tbaa !16
  %97 = fcmp contract olt float %89, %96
  br i1 %97, label %98, label %101

98:                                               ; preds = %93
  store float %96, float addrspace(3)* %58, align 4, !tbaa !16
  %99 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %94
  %100 = load i32, i32 addrspace(3)* %99, align 4, !tbaa !20
  store i32 %100, i32 addrspace(3)* %59, align 4, !tbaa !20
  br label %101

101:                                              ; preds = %93, %98, %91
  %102 = phi float [ %96, %98 ], [ %89, %93 ], [ %89, %91 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %103

103:                                              ; preds = %101, %88
  %104 = phi float [ %102, %101 ], [ %89, %88 ]
  %105 = icmp ult i32 %6, 32
  br i1 %105, label %106, label %202

106:                                              ; preds = %103
  %107 = icmp sgt i32 %4, 63
  br i1 %107, label %108, label %121

108:                                              ; preds = %106
  %109 = add nuw nsw i32 %6, 32
  %110 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %109
  %111 = addrspacecast float addrspace(3)* %110 to float*
  %112 = load volatile float, float* %111, align 4, !tbaa !16
  %113 = fcmp contract olt float %104, %112
  br i1 %113, label %114, label %121

114:                                              ; preds = %108
  %115 = load volatile float, float* %111, align 4, !tbaa !16
  %116 = addrspacecast float addrspace(3)* %58 to float*
  store volatile float %115, float* %116, align 4, !tbaa !16
  %117 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %109
  %118 = addrspacecast i32 addrspace(3)* %117 to i32*
  %119 = load volatile i32, i32* %118, align 4, !tbaa !20
  %120 = addrspacecast i32 addrspace(3)* %59 to i32*
  store volatile i32 %119, i32* %120, align 4, !tbaa !20
  br label %121

121:                                              ; preds = %108, %114, %106
  %122 = phi float [ %115, %114 ], [ %104, %108 ], [ %104, %106 ]
  %123 = icmp sgt i32 %4, 31
  br i1 %123, label %124, label %137

124:                                              ; preds = %121
  %125 = add nuw nsw i32 %6, 16
  %126 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %125
  %127 = addrspacecast float addrspace(3)* %126 to float*
  %128 = load volatile float, float* %127, align 4, !tbaa !16
  %129 = fcmp contract olt float %122, %128
  br i1 %129, label %130, label %137

130:                                              ; preds = %124
  %131 = load volatile float, float* %127, align 4, !tbaa !16
  %132 = addrspacecast float addrspace(3)* %58 to float*
  store volatile float %131, float* %132, align 4, !tbaa !16
  %133 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %125
  %134 = addrspacecast i32 addrspace(3)* %133 to i32*
  %135 = load volatile i32, i32* %134, align 4, !tbaa !20
  %136 = addrspacecast i32 addrspace(3)* %59 to i32*
  store volatile i32 %135, i32* %136, align 4, !tbaa !20
  br label %137

137:                                              ; preds = %124, %130, %121
  %138 = phi float [ %131, %130 ], [ %122, %124 ], [ %122, %121 ]
  %139 = icmp sgt i32 %4, 15
  br i1 %139, label %140, label %153

140:                                              ; preds = %137
  %141 = add nuw nsw i32 %6, 8
  %142 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %141
  %143 = addrspacecast float addrspace(3)* %142 to float*
  %144 = load volatile float, float* %143, align 4, !tbaa !16
  %145 = fcmp contract olt float %138, %144
  br i1 %145, label %146, label %153

146:                                              ; preds = %140
  %147 = load volatile float, float* %143, align 4, !tbaa !16
  %148 = addrspacecast float addrspace(3)* %58 to float*
  store volatile float %147, float* %148, align 4, !tbaa !16
  %149 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %141
  %150 = addrspacecast i32 addrspace(3)* %149 to i32*
  %151 = load volatile i32, i32* %150, align 4, !tbaa !20
  %152 = addrspacecast i32 addrspace(3)* %59 to i32*
  store volatile i32 %151, i32* %152, align 4, !tbaa !20
  br label %153

153:                                              ; preds = %140, %146, %137
  %154 = phi float [ %147, %146 ], [ %138, %140 ], [ %138, %137 ]
  %155 = icmp sgt i32 %4, 7
  br i1 %155, label %156, label %169

156:                                              ; preds = %153
  %157 = add nuw nsw i32 %6, 4
  %158 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %157
  %159 = addrspacecast float addrspace(3)* %158 to float*
  %160 = load volatile float, float* %159, align 4, !tbaa !16
  %161 = fcmp contract olt float %154, %160
  br i1 %161, label %162, label %169

162:                                              ; preds = %156
  %163 = load volatile float, float* %159, align 4, !tbaa !16
  %164 = addrspacecast float addrspace(3)* %58 to float*
  store volatile float %163, float* %164, align 4, !tbaa !16
  %165 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %157
  %166 = addrspacecast i32 addrspace(3)* %165 to i32*
  %167 = load volatile i32, i32* %166, align 4, !tbaa !20
  %168 = addrspacecast i32 addrspace(3)* %59 to i32*
  store volatile i32 %167, i32* %168, align 4, !tbaa !20
  br label %169

169:                                              ; preds = %156, %162, %153
  %170 = phi float [ %163, %162 ], [ %154, %156 ], [ %154, %153 ]
  %171 = icmp sgt i32 %4, 3
  br i1 %171, label %172, label %185

172:                                              ; preds = %169
  %173 = add nuw nsw i32 %6, 2
  %174 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %173
  %175 = addrspacecast float addrspace(3)* %174 to float*
  %176 = load volatile float, float* %175, align 4, !tbaa !16
  %177 = fcmp contract olt float %170, %176
  br i1 %177, label %178, label %185

178:                                              ; preds = %172
  %179 = load volatile float, float* %175, align 4, !tbaa !16
  %180 = addrspacecast float addrspace(3)* %58 to float*
  store volatile float %179, float* %180, align 4, !tbaa !16
  %181 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %173
  %182 = addrspacecast i32 addrspace(3)* %181 to i32*
  %183 = load volatile i32, i32* %182, align 4, !tbaa !20
  %184 = addrspacecast i32 addrspace(3)* %59 to i32*
  store volatile i32 %183, i32* %184, align 4, !tbaa !20
  br label %185

185:                                              ; preds = %172, %178, %169
  %186 = phi float [ %179, %178 ], [ %170, %172 ], [ %170, %169 ]
  %187 = icmp sgt i32 %4, 1
  br i1 %187, label %188, label %201

188:                                              ; preds = %185
  %189 = add nuw nsw i32 %6, 1
  %190 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 %189
  %191 = addrspacecast float addrspace(3)* %190 to float*
  %192 = load volatile float, float* %191, align 4, !tbaa !16
  %193 = fcmp contract olt float %186, %192
  br i1 %193, label %194, label %201

194:                                              ; preds = %188
  %195 = load volatile float, float* %191, align 4, !tbaa !16
  %196 = addrspacecast float addrspace(3)* %58 to float*
  store volatile float %195, float* %196, align 4, !tbaa !16
  %197 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 %189
  %198 = addrspacecast i32 addrspace(3)* %197 to i32*
  %199 = load volatile i32, i32* %198, align 4, !tbaa !20
  %200 = addrspacecast i32 addrspace(3)* %59 to i32*
  store volatile i32 %199, i32* %200, align 4, !tbaa !20
  br label %201

201:                                              ; preds = %188, %194, %185
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br label %202

202:                                              ; preds = %201, %103
  %203 = icmp eq i32 %6, 0
  br i1 %203, label %204, label %210

204:                                              ; preds = %202
  %205 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE5sdata, i32 0, i32 0), align 16, !tbaa !16
  %206 = zext i32 %7 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %1, i64 %206
  store float %205, float addrspace(1)* %207, align 4, !tbaa !16
  %208 = load i32, i32 addrspace(3)* getelementptr inbounds ([256 x i32], [256 x i32] addrspace(3)* @_ZZ17reduce_max_finalfPfS_PijiE7idxData, i32 0, i32 0), align 16, !tbaa !20
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %206
  store i32 %208, i32 addrspace(1)* %209, align 4, !tbaa !20
  br label %210

210:                                              ; preds = %204, %202
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
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}

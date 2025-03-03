; ModuleID = '../data/hip_kernels/15412/124/main.cu'
source_filename = "../data/hip_kernels/15412/124/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28forward_maxpool_layer_kerneliiiiiiiiPfS_Pi(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, float addrspace(1)* nocapture readonly %8, float addrspace(1)* nocapture writeonly %9, i32 addrspace(1)* writeonly %10) local_unnamed_addr #0 {
  %12 = sub i32 %1, %6
  %13 = add i32 %12, %7
  %14 = sdiv i32 %13, %5
  %15 = add nsw i32 %14, 1
  %16 = sub i32 %2, %6
  %17 = add i32 %16, %7
  %18 = sdiv i32 %17, %4
  %19 = add nsw i32 %18, 1
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %22 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %23 = getelementptr inbounds i8, i8 addrspace(4)* %22, i64 12
  %24 = bitcast i8 addrspace(4)* %23 to i32 addrspace(4)*
  %25 = load i32, i32 addrspace(4)* %24, align 4, !tbaa !4
  %26 = getelementptr i8, i8 addrspace(4)* %22, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !13, !invariant.load !14
  %29 = zext i16 %28 to i32
  %30 = udiv i32 %25, %29
  %31 = mul i32 %30, %29
  %32 = icmp ugt i32 %25, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %21
  %36 = add i32 %35, %20
  %37 = mul i32 %36, %29
  %38 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %39 = add i32 %37, %38
  %40 = icmp slt i32 %39, %0
  br i1 %40, label %41, label %195

41:                                               ; preds = %11
  %42 = freeze i32 %39
  %43 = freeze i32 %19
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = freeze i32 %15
  %48 = sdiv i32 %44, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %44, %49
  %51 = freeze i32 %48
  %52 = sdiv i32 %7, -2
  %53 = mul nsw i32 %51, %15
  %54 = add nsw i32 %53, %50
  %55 = mul nsw i32 %54, %19
  %56 = add nsw i32 %55, %46
  %57 = icmp sgt i32 %6, 0
  br i1 %57, label %58, label %187

58:                                               ; preds = %41
  %59 = mul nsw i32 %50, %5
  %60 = add nsw i32 %59, %52
  %61 = mul nsw i32 %46, %4
  %62 = add nsw i32 %61, %52
  %63 = mul nsw i32 %51, %1
  %64 = and i32 %6, 3
  %65 = icmp ult i32 %6, 4
  %66 = and i32 %6, -4
  %67 = icmp eq i32 %64, 0
  br label %68

68:                                               ; preds = %58, %182
  %69 = phi float [ 0xFFF0000000000000, %58 ], [ %184, %182 ]
  %70 = phi i32 [ -1, %58 ], [ %183, %182 ]
  %71 = phi i32 [ 0, %58 ], [ %185, %182 ]
  %72 = add nsw i32 %60, %71
  %73 = add nsw i32 %72, %63
  %74 = mul nsw i32 %73, %2
  %75 = icmp sgt i32 %72, -1
  %76 = icmp slt i32 %72, %1
  br i1 %65, label %152, label %77

77:                                               ; preds = %68, %144
  %78 = phi float [ %148, %144 ], [ %69, %68 ]
  %79 = phi i32 [ %147, %144 ], [ %70, %68 ]
  %80 = phi i32 [ %149, %144 ], [ 0, %68 ]
  %81 = phi i32 [ %150, %144 ], [ 0, %68 ]
  %82 = add nsw i32 %62, %80
  %83 = add nsw i32 %82, %74
  br i1 %75, label %84, label %93

84:                                               ; preds = %77
  %85 = icmp sgt i32 %82, -1
  %86 = select i1 %76, i1 %85, i1 false
  %87 = icmp slt i32 %82, %2
  %88 = select i1 %86, i1 %87, i1 false
  br i1 %88, label %89, label %93

89:                                               ; preds = %84
  %90 = sext i32 %83 to i64
  %91 = getelementptr inbounds float, float addrspace(1)* %8, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %93

93:                                               ; preds = %77, %84, %89
  %94 = phi contract float [ %92, %89 ], [ 0xFFF0000000000000, %84 ], [ 0xFFF0000000000000, %77 ]
  %95 = fcmp contract ogt float %94, %78
  %96 = select i1 %95, i32 %83, i32 %79
  %97 = select contract i1 %95, float %94, float %78
  %98 = or i32 %80, 1
  %99 = add nsw i32 %62, %98
  %100 = add nsw i32 %99, %74
  br i1 %75, label %101, label %110

101:                                              ; preds = %93
  %102 = icmp sgt i32 %99, -1
  %103 = select i1 %76, i1 %102, i1 false
  %104 = icmp slt i32 %99, %2
  %105 = select i1 %103, i1 %104, i1 false
  br i1 %105, label %106, label %110

106:                                              ; preds = %101
  %107 = sext i32 %100 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %8, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %110

110:                                              ; preds = %106, %101, %93
  %111 = phi contract float [ %109, %106 ], [ 0xFFF0000000000000, %101 ], [ 0xFFF0000000000000, %93 ]
  %112 = fcmp contract ogt float %111, %97
  %113 = select i1 %112, i32 %100, i32 %96
  %114 = select contract i1 %112, float %111, float %97
  %115 = or i32 %80, 2
  %116 = add nsw i32 %62, %115
  %117 = add nsw i32 %116, %74
  br i1 %75, label %118, label %127

118:                                              ; preds = %110
  %119 = icmp sgt i32 %116, -1
  %120 = select i1 %76, i1 %119, i1 false
  %121 = icmp slt i32 %116, %2
  %122 = select i1 %120, i1 %121, i1 false
  br i1 %122, label %123, label %127

123:                                              ; preds = %118
  %124 = sext i32 %117 to i64
  %125 = getelementptr inbounds float, float addrspace(1)* %8, i64 %124
  %126 = load float, float addrspace(1)* %125, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %127

127:                                              ; preds = %123, %118, %110
  %128 = phi contract float [ %126, %123 ], [ 0xFFF0000000000000, %118 ], [ 0xFFF0000000000000, %110 ]
  %129 = fcmp contract ogt float %128, %114
  %130 = select i1 %129, i32 %117, i32 %113
  %131 = select contract i1 %129, float %128, float %114
  %132 = or i32 %80, 3
  %133 = add nsw i32 %62, %132
  %134 = add nsw i32 %133, %74
  br i1 %75, label %135, label %144

135:                                              ; preds = %127
  %136 = icmp sgt i32 %133, -1
  %137 = select i1 %76, i1 %136, i1 false
  %138 = icmp slt i32 %133, %2
  %139 = select i1 %137, i1 %138, i1 false
  br i1 %139, label %140, label %144

140:                                              ; preds = %135
  %141 = sext i32 %134 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %8, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %144

144:                                              ; preds = %140, %135, %127
  %145 = phi contract float [ %143, %140 ], [ 0xFFF0000000000000, %135 ], [ 0xFFF0000000000000, %127 ]
  %146 = fcmp contract ogt float %145, %131
  %147 = select i1 %146, i32 %134, i32 %130
  %148 = select contract i1 %146, float %145, float %131
  %149 = add nuw nsw i32 %80, 4
  %150 = add i32 %81, 4
  %151 = icmp eq i32 %150, %66
  br i1 %151, label %152, label %77, !llvm.loop !20

152:                                              ; preds = %144, %68
  %153 = phi i32 [ undef, %68 ], [ %147, %144 ]
  %154 = phi float [ undef, %68 ], [ %148, %144 ]
  %155 = phi float [ %69, %68 ], [ %148, %144 ]
  %156 = phi i32 [ %70, %68 ], [ %147, %144 ]
  %157 = phi i32 [ 0, %68 ], [ %149, %144 ]
  br i1 %67, label %182, label %158

158:                                              ; preds = %152, %174
  %159 = phi float [ %178, %174 ], [ %155, %152 ]
  %160 = phi i32 [ %177, %174 ], [ %156, %152 ]
  %161 = phi i32 [ %179, %174 ], [ %157, %152 ]
  %162 = phi i32 [ %180, %174 ], [ 0, %152 ]
  %163 = add nsw i32 %62, %161
  %164 = add nsw i32 %163, %74
  br i1 %75, label %165, label %174

165:                                              ; preds = %158
  %166 = icmp sgt i32 %163, -1
  %167 = select i1 %76, i1 %166, i1 false
  %168 = icmp slt i32 %163, %2
  %169 = select i1 %167, i1 %168, i1 false
  br i1 %169, label %170, label %174

170:                                              ; preds = %165
  %171 = sext i32 %164 to i64
  %172 = getelementptr inbounds float, float addrspace(1)* %8, i64 %171
  %173 = load float, float addrspace(1)* %172, align 4, !tbaa !16, !amdgpu.noclobber !14
  br label %174

174:                                              ; preds = %170, %165, %158
  %175 = phi contract float [ %173, %170 ], [ 0xFFF0000000000000, %165 ], [ 0xFFF0000000000000, %158 ]
  %176 = fcmp contract ogt float %175, %159
  %177 = select i1 %176, i32 %164, i32 %160
  %178 = select contract i1 %176, float %175, float %159
  %179 = add nuw nsw i32 %161, 1
  %180 = add i32 %162, 1
  %181 = icmp eq i32 %180, %64
  br i1 %181, label %182, label %158, !llvm.loop !22

182:                                              ; preds = %174, %152
  %183 = phi i32 [ %153, %152 ], [ %177, %174 ]
  %184 = phi float [ %154, %152 ], [ %178, %174 ]
  %185 = add nuw nsw i32 %71, 1
  %186 = icmp eq i32 %185, %6
  br i1 %186, label %187, label %68, !llvm.loop !24

187:                                              ; preds = %182, %41
  %188 = phi i32 [ -1, %41 ], [ %183, %182 ]
  %189 = phi float [ 0xFFF0000000000000, %41 ], [ %184, %182 ]
  %190 = sext i32 %56 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %9, i64 %190
  store float %189, float addrspace(1)* %191, align 4, !tbaa !16
  %192 = icmp eq i32 addrspace(1)* %10, addrspacecast (i32* null to i32 addrspace(1)*)
  br i1 %192, label %195, label %193

193:                                              ; preds = %187
  %194 = getelementptr inbounds i32, i32 addrspace(1)* %10, i64 %190
  store i32 %188, i32 addrspace(1)* %194, align 4, !tbaa !25
  br label %195

195:                                              ; preds = %187, %193, %11
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !21}
!25 = !{!26, !26, i64 0}
!26 = !{!"int", !18, i64 0}

; ModuleID = '../data/hip_kernels/9100/34/main.cu'
source_filename = "../data/hip_kernels/9100/34/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z46_bcnn_forward_depthwise_sep_conv_weight_kerneliPfS_iiiiiiiiS_(i32 %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, float addrspace(1)* nocapture writeonly %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 4, !range !4, !invariant.load !5
  %18 = zext i16 %17 to i32
  %19 = getelementptr inbounds i8, i8 addrspace(4)* %14, i64 12
  %20 = bitcast i8 addrspace(4)* %19 to i32 addrspace(4)*
  %21 = load i32, i32 addrspace(4)* %20, align 4, !tbaa !6
  %22 = mul i32 %13, %18
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %0
  br i1 %25, label %26, label %194

26:                                               ; preds = %12
  %27 = mul i32 %8, %8
  %28 = icmp sgt i32 %8, 0
  %29 = udiv i32 %21, %18
  %30 = mul i32 %29, %18
  %31 = icmp ugt i32 %21, %30
  %32 = zext i1 %31 to i32
  %33 = add i32 %29, %32
  %34 = mul i32 %33, %18
  %35 = and i32 %8, 3
  %36 = icmp ult i32 %8, 4
  %37 = and i32 %8, -4
  %38 = icmp eq i32 %35, 0
  br label %39

39:                                               ; preds = %26, %188
  %40 = phi i32 [ %24, %26 ], [ %192, %188 ]
  %41 = sdiv i32 %40, %4
  %42 = sdiv i32 %41, %5
  %43 = srem i32 %42, %3
  br i1 %28, label %44, label %188

44:                                               ; preds = %39
  %45 = mul i32 %27, %43
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = freeze i32 %40
  %49 = freeze i32 %5
  %50 = sdiv i32 %48, %49
  %51 = mul i32 %50, %49
  %52 = sub i32 %48, %51
  %53 = srem i32 %50, %4
  %54 = sdiv i32 %40, %3
  %55 = sdiv i32 %54, %4
  %56 = sdiv i32 %55, %5
  %57 = mul nsw i32 %53, %9
  %58 = sub i32 %57, %10
  %59 = mul nsw i32 %52, %9
  %60 = sub i32 %59, %10
  %61 = mul nsw i32 %56, %3
  %62 = add nsw i32 %43, %61
  %63 = mul nsw i32 %62, %6
  br label %64

64:                                               ; preds = %44, %183
  %65 = phi float addrspace(1)* [ %47, %44 ], [ %185, %183 ]
  %66 = phi float [ 0.000000e+00, %44 ], [ %184, %183 ]
  %67 = phi i32 [ 0, %44 ], [ %186, %183 ]
  %68 = add nsw i32 %67, %58
  %69 = icmp sgt i32 %68, -1
  %70 = icmp slt i32 %68, %6
  %71 = add nsw i32 %68, %63
  %72 = mul nsw i32 %71, %7
  br i1 %36, label %152, label %73

73:                                               ; preds = %64, %146
  %74 = phi float addrspace(1)* [ %148, %146 ], [ %65, %64 ]
  %75 = phi float [ %147, %146 ], [ %66, %64 ]
  %76 = phi i32 [ %149, %146 ], [ 0, %64 ]
  %77 = phi i32 [ %150, %146 ], [ 0, %64 ]
  %78 = add nsw i32 %76, %60
  br i1 %69, label %79, label %92

79:                                               ; preds = %73
  %80 = icmp sgt i32 %78, -1
  %81 = select i1 %70, i1 %80, i1 false
  %82 = icmp slt i32 %78, %7
  %83 = select i1 %81, i1 %82, i1 false
  br i1 %83, label %84, label %92

84:                                               ; preds = %79
  %85 = add nsw i32 %78, %72
  %86 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %87 = sext i32 %85 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %1, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  %90 = fmul contract float %86, %89
  %91 = fadd contract float %75, %90
  br label %92

92:                                               ; preds = %84, %79, %73
  %93 = phi float [ %91, %84 ], [ %75, %79 ], [ %75, %73 ]
  %94 = getelementptr inbounds float, float addrspace(1)* %74, i64 1
  %95 = or i32 %76, 1
  %96 = add nsw i32 %95, %60
  br i1 %69, label %97, label %110

97:                                               ; preds = %92
  %98 = icmp sgt i32 %96, -1
  %99 = select i1 %70, i1 %98, i1 false
  %100 = icmp slt i32 %96, %7
  %101 = select i1 %99, i1 %100, i1 false
  br i1 %101, label %102, label %110

102:                                              ; preds = %97
  %103 = add nsw i32 %96, %72
  %104 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %105 = sext i32 %103 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %1, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !16
  %108 = fmul contract float %104, %107
  %109 = fadd contract float %93, %108
  br label %110

110:                                              ; preds = %102, %97, %92
  %111 = phi float [ %109, %102 ], [ %93, %97 ], [ %93, %92 ]
  %112 = getelementptr inbounds float, float addrspace(1)* %74, i64 2
  %113 = or i32 %76, 2
  %114 = add nsw i32 %113, %60
  br i1 %69, label %115, label %128

115:                                              ; preds = %110
  %116 = icmp sgt i32 %114, -1
  %117 = select i1 %70, i1 %116, i1 false
  %118 = icmp slt i32 %114, %7
  %119 = select i1 %117, i1 %118, i1 false
  br i1 %119, label %120, label %128

120:                                              ; preds = %115
  %121 = add nsw i32 %114, %72
  %122 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %123 = sext i32 %121 to i64
  %124 = getelementptr inbounds float, float addrspace(1)* %1, i64 %123
  %125 = load float, float addrspace(1)* %124, align 4, !tbaa !16
  %126 = fmul contract float %122, %125
  %127 = fadd contract float %111, %126
  br label %128

128:                                              ; preds = %120, %115, %110
  %129 = phi float [ %127, %120 ], [ %111, %115 ], [ %111, %110 ]
  %130 = getelementptr inbounds float, float addrspace(1)* %74, i64 3
  %131 = or i32 %76, 3
  %132 = add nsw i32 %131, %60
  br i1 %69, label %133, label %146

133:                                              ; preds = %128
  %134 = icmp sgt i32 %132, -1
  %135 = select i1 %70, i1 %134, i1 false
  %136 = icmp slt i32 %132, %7
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %146

138:                                              ; preds = %133
  %139 = add nsw i32 %132, %72
  %140 = load float, float addrspace(1)* %130, align 4, !tbaa !16
  %141 = sext i32 %139 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %1, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !16
  %144 = fmul contract float %140, %143
  %145 = fadd contract float %129, %144
  br label %146

146:                                              ; preds = %138, %133, %128
  %147 = phi float [ %145, %138 ], [ %129, %133 ], [ %129, %128 ]
  %148 = getelementptr inbounds float, float addrspace(1)* %74, i64 4
  %149 = add nuw nsw i32 %76, 4
  %150 = add i32 %77, 4
  %151 = icmp eq i32 %150, %37
  br i1 %151, label %152, label %73, !llvm.loop !20

152:                                              ; preds = %146, %64
  %153 = phi float [ undef, %64 ], [ %147, %146 ]
  %154 = phi float addrspace(1)* [ undef, %64 ], [ %148, %146 ]
  %155 = phi float addrspace(1)* [ %65, %64 ], [ %148, %146 ]
  %156 = phi float [ %66, %64 ], [ %147, %146 ]
  %157 = phi i32 [ 0, %64 ], [ %149, %146 ]
  br i1 %38, label %183, label %158

158:                                              ; preds = %152, %177
  %159 = phi float addrspace(1)* [ %179, %177 ], [ %155, %152 ]
  %160 = phi float [ %178, %177 ], [ %156, %152 ]
  %161 = phi i32 [ %180, %177 ], [ %157, %152 ]
  %162 = phi i32 [ %181, %177 ], [ 0, %152 ]
  %163 = add nsw i32 %161, %60
  br i1 %69, label %164, label %177

164:                                              ; preds = %158
  %165 = icmp sgt i32 %163, -1
  %166 = select i1 %70, i1 %165, i1 false
  %167 = icmp slt i32 %163, %7
  %168 = select i1 %166, i1 %167, i1 false
  br i1 %168, label %169, label %177

169:                                              ; preds = %164
  %170 = add nsw i32 %163, %72
  %171 = load float, float addrspace(1)* %159, align 4, !tbaa !16
  %172 = sext i32 %170 to i64
  %173 = getelementptr inbounds float, float addrspace(1)* %1, i64 %172
  %174 = load float, float addrspace(1)* %173, align 4, !tbaa !16
  %175 = fmul contract float %171, %174
  %176 = fadd contract float %160, %175
  br label %177

177:                                              ; preds = %169, %164, %158
  %178 = phi float [ %176, %169 ], [ %160, %164 ], [ %160, %158 ]
  %179 = getelementptr inbounds float, float addrspace(1)* %159, i64 1
  %180 = add nuw nsw i32 %161, 1
  %181 = add i32 %162, 1
  %182 = icmp eq i32 %181, %35
  br i1 %182, label %183, label %158, !llvm.loop !22

183:                                              ; preds = %177, %152
  %184 = phi float [ %153, %152 ], [ %178, %177 ]
  %185 = phi float addrspace(1)* [ %154, %152 ], [ %179, %177 ]
  %186 = add nuw nsw i32 %67, 1
  %187 = icmp eq i32 %186, %8
  br i1 %187, label %188, label %64, !llvm.loop !24

188:                                              ; preds = %183, %39
  %189 = phi float [ 0.000000e+00, %39 ], [ %184, %183 ]
  %190 = sext i32 %40 to i64
  %191 = getelementptr inbounds float, float addrspace(1)* %11, i64 %190
  store float %189, float addrspace(1)* %191, align 4, !tbaa !16
  %192 = add i32 %34, %40
  %193 = icmp slt i32 %192, %0
  br i1 %193, label %39, label %194, !llvm.loop !25

194:                                              ; preds = %188, %12
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
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
!25 = distinct !{!25, !21}

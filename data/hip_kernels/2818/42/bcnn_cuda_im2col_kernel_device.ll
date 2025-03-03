; ModuleID = '../data/hip_kernels/2818/42/main.cu'
source_filename = "../data/hip_kernels/2818/42/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z23bcnn_cuda_im2col_kerneliPKfiiiiiiiPf(i32 %0, float addrspace(1)* nocapture readonly %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float addrspace(1)* nocapture writeonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = getelementptr inbounds i8, i8 addrspace(4)* %12, i64 12
  %18 = bitcast i8 addrspace(4)* %17 to i32 addrspace(4)*
  %19 = load i32, i32 addrspace(4)* %18, align 4, !tbaa !6
  %20 = mul i32 %11, %16
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = icmp slt i32 %22, %0
  br i1 %23, label %24, label %173

24:                                               ; preds = %10
  %25 = mul i32 %4, %4
  %26 = mul i32 %25, %7
  %27 = icmp sgt i32 %4, 0
  %28 = mul nsw i32 %8, %7
  %29 = sext i32 %28 to i64
  %30 = udiv i32 %19, %16
  %31 = mul i32 %30, %16
  %32 = icmp ugt i32 %19, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %30, %33
  %35 = mul i32 %34, %16
  %36 = and i32 %4, 3
  %37 = icmp ult i32 %4, 4
  %38 = and i32 %4, -4
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %24, %170
  %41 = phi i32 [ %22, %24 ], [ %171, %170 ]
  %42 = freeze i32 %41
  %43 = freeze i32 %8
  %44 = sdiv i32 %42, %43
  %45 = mul i32 %44, %43
  %46 = sub i32 %42, %45
  %47 = freeze i32 %7
  %48 = sdiv i32 %44, %47
  %49 = mul i32 %48, %47
  %50 = sub i32 %44, %49
  %51 = mul nsw i32 %50, %6
  %52 = sub nsw i32 %51, %5
  %53 = mul nsw i32 %46, %6
  %54 = sub nsw i32 %53, %5
  %55 = mul nsw i32 %48, %2
  %56 = add nsw i32 %55, %52
  %57 = mul nsw i32 %56, %3
  %58 = add nsw i32 %57, %54
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds float, float addrspace(1)* %1, i64 %59
  br i1 %27, label %61, label %170

61:                                               ; preds = %40
  %62 = mul i32 %26, %48
  %63 = add nsw i32 %62, %50
  %64 = mul nsw i32 %63, %8
  %65 = add nsw i32 %64, %46
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %9, i64 %66
  br label %68

68:                                               ; preds = %61, %166
  %69 = phi float addrspace(1)* [ %167, %166 ], [ %67, %61 ]
  %70 = phi i32 [ %168, %166 ], [ 0, %61 ]
  %71 = add nsw i32 %70, %52
  %72 = icmp sgt i32 %71, -1
  %73 = icmp slt i32 %71, %2
  %74 = mul nsw i32 %70, %3
  br i1 %37, label %141, label %75

75:                                               ; preds = %68, %135
  %76 = phi float addrspace(1)* [ %137, %135 ], [ %69, %68 ]
  %77 = phi i32 [ %138, %135 ], [ 0, %68 ]
  %78 = phi i32 [ %139, %135 ], [ 0, %68 ]
  %79 = add nsw i32 %77, %54
  %80 = icmp sgt i32 %79, -1
  %81 = select i1 %72, i1 %80, i1 false
  %82 = select i1 %81, i1 %73, i1 false
  %83 = icmp slt i32 %79, %3
  %84 = select i1 %82, i1 %83, i1 false
  br i1 %84, label %85, label %90

85:                                               ; preds = %75
  %86 = add nsw i32 %77, %74
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds float, float addrspace(1)* %60, i64 %87
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !16
  br label %90

90:                                               ; preds = %75, %85
  %91 = phi contract float [ %89, %85 ], [ 0.000000e+00, %75 ]
  store float %91, float addrspace(1)* %76, align 4, !tbaa !16
  %92 = getelementptr inbounds float, float addrspace(1)* %76, i64 %29
  %93 = or i32 %77, 1
  %94 = add nsw i32 %93, %54
  %95 = icmp sgt i32 %94, -1
  %96 = select i1 %72, i1 %95, i1 false
  %97 = select i1 %96, i1 %73, i1 false
  %98 = icmp slt i32 %94, %3
  %99 = select i1 %97, i1 %98, i1 false
  br i1 %99, label %100, label %105

100:                                              ; preds = %90
  %101 = add nsw i32 %93, %74
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %60, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !16
  br label %105

105:                                              ; preds = %100, %90
  %106 = phi contract float [ %104, %100 ], [ 0.000000e+00, %90 ]
  store float %106, float addrspace(1)* %92, align 4, !tbaa !16
  %107 = getelementptr inbounds float, float addrspace(1)* %92, i64 %29
  %108 = or i32 %77, 2
  %109 = add nsw i32 %108, %54
  %110 = icmp sgt i32 %109, -1
  %111 = select i1 %72, i1 %110, i1 false
  %112 = select i1 %111, i1 %73, i1 false
  %113 = icmp slt i32 %109, %3
  %114 = select i1 %112, i1 %113, i1 false
  br i1 %114, label %115, label %120

115:                                              ; preds = %105
  %116 = add nsw i32 %108, %74
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %60, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  br label %120

120:                                              ; preds = %115, %105
  %121 = phi contract float [ %119, %115 ], [ 0.000000e+00, %105 ]
  store float %121, float addrspace(1)* %107, align 4, !tbaa !16
  %122 = getelementptr inbounds float, float addrspace(1)* %107, i64 %29
  %123 = or i32 %77, 3
  %124 = add nsw i32 %123, %54
  %125 = icmp sgt i32 %124, -1
  %126 = select i1 %72, i1 %125, i1 false
  %127 = select i1 %126, i1 %73, i1 false
  %128 = icmp slt i32 %124, %3
  %129 = select i1 %127, i1 %128, i1 false
  br i1 %129, label %130, label %135

130:                                              ; preds = %120
  %131 = add nsw i32 %123, %74
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %60, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !16
  br label %135

135:                                              ; preds = %130, %120
  %136 = phi contract float [ %134, %130 ], [ 0.000000e+00, %120 ]
  store float %136, float addrspace(1)* %122, align 4, !tbaa !16
  %137 = getelementptr inbounds float, float addrspace(1)* %122, i64 %29
  %138 = add nuw nsw i32 %77, 4
  %139 = add i32 %78, 4
  %140 = icmp eq i32 %139, %38
  br i1 %140, label %141, label %75, !llvm.loop !20

141:                                              ; preds = %135, %68
  %142 = phi float addrspace(1)* [ undef, %68 ], [ %137, %135 ]
  %143 = phi float addrspace(1)* [ %69, %68 ], [ %137, %135 ]
  %144 = phi i32 [ 0, %68 ], [ %138, %135 ]
  br i1 %39, label %166, label %145

145:                                              ; preds = %141, %160
  %146 = phi float addrspace(1)* [ %162, %160 ], [ %143, %141 ]
  %147 = phi i32 [ %163, %160 ], [ %144, %141 ]
  %148 = phi i32 [ %164, %160 ], [ 0, %141 ]
  %149 = add nsw i32 %147, %54
  %150 = icmp sgt i32 %149, -1
  %151 = select i1 %72, i1 %150, i1 false
  %152 = select i1 %151, i1 %73, i1 false
  %153 = icmp slt i32 %149, %3
  %154 = select i1 %152, i1 %153, i1 false
  br i1 %154, label %155, label %160

155:                                              ; preds = %145
  %156 = add nsw i32 %147, %74
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %60, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !16
  br label %160

160:                                              ; preds = %155, %145
  %161 = phi contract float [ %159, %155 ], [ 0.000000e+00, %145 ]
  store float %161, float addrspace(1)* %146, align 4, !tbaa !16
  %162 = getelementptr inbounds float, float addrspace(1)* %146, i64 %29
  %163 = add nuw nsw i32 %147, 1
  %164 = add i32 %148, 1
  %165 = icmp eq i32 %164, %36
  br i1 %165, label %166, label %145, !llvm.loop !22

166:                                              ; preds = %160, %141
  %167 = phi float addrspace(1)* [ %142, %141 ], [ %162, %160 ]
  %168 = add nuw nsw i32 %70, 1
  %169 = icmp eq i32 %168, %4
  br i1 %169, label %170, label %68, !llvm.loop !24

170:                                              ; preds = %166, %40
  %171 = add i32 %35, %41
  %172 = icmp slt i32 %171, %0
  br i1 %172, label %40, label %173, !llvm.loop !25

173:                                              ; preds = %170, %10
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

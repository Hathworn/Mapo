; ModuleID = '../data/hip_kernels/5182/47/main.cu'
source_filename = "../data/hip_kernels/5182/47/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15LSTMDeltaKernelPfS_S_S_S_S_ii(float addrspace(1)* nocapture writeonly %0, float addrspace(1)* nocapture writeonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = udiv i32 %16, %13
  %20 = mul i32 %19, %13
  %21 = icmp ugt i32 %16, %20
  %22 = zext i1 %21 to i32
  %23 = add i32 %19, %22
  %24 = mul i32 %23, %18
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %26 = add i32 %24, %17
  %27 = mul i32 %26, %13
  %28 = add i32 %27, %25
  %29 = sdiv i32 %6, %7
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %162

31:                                               ; preds = %8
  %32 = mul nsw i32 %28, %7
  %33 = add nsw i32 %28, 1
  %34 = mul nsw i32 %33, %7
  %35 = icmp slt i32 %32, %34
  %36 = sext i32 %28 to i64
  br i1 %35, label %37, label %64

37:                                               ; preds = %31
  %38 = getelementptr inbounds float, float addrspace(1)* %3, i64 %36
  %39 = add i32 %7, -1
  %40 = and i32 %7, 7
  %41 = icmp eq i32 %40, 0
  br i1 %41, label %59, label %42

42:                                               ; preds = %37, %42
  %43 = phi float [ %55, %42 ], [ 0.000000e+00, %37 ]
  %44 = phi i32 [ %56, %42 ], [ %32, %37 ]
  %45 = phi i32 [ %57, %42 ], [ 0, %37 ]
  %46 = sext i32 %44 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %5, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !16
  %49 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %50 = fmul contract float %48, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %0, i64 %46
  store float %50, float addrspace(1)* %51, align 4, !tbaa !16
  %52 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !16
  %54 = fmul contract float %48, %53
  %55 = fadd contract float %43, %54
  %56 = add nsw i32 %44, 1
  %57 = add i32 %45, 1
  %58 = icmp eq i32 %57, %40
  br i1 %58, label %59, label %42, !llvm.loop !20

59:                                               ; preds = %42, %37
  %60 = phi float [ undef, %37 ], [ %55, %42 ]
  %61 = phi float [ 0.000000e+00, %37 ], [ %55, %42 ]
  %62 = phi i32 [ %32, %37 ], [ %56, %42 ]
  %63 = icmp ult i32 %39, 7
  br i1 %63, label %64, label %70

64:                                               ; preds = %59, %70, %31
  %65 = phi float [ 0.000000e+00, %31 ], [ %60, %59 ], [ %159, %70 ]
  %66 = getelementptr inbounds float, float addrspace(1)* %4, i64 %36
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !16
  %68 = fmul contract float %65, %67
  %69 = getelementptr inbounds float, float addrspace(1)* %1, i64 %36
  store float %68, float addrspace(1)* %69, align 4, !tbaa !16
  br label %162

70:                                               ; preds = %59, %70
  %71 = phi float [ %159, %70 ], [ %61, %59 ]
  %72 = phi i32 [ %160, %70 ], [ %62, %59 ]
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %5, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !16
  %76 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %77 = fmul contract float %75, %76
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  store float %77, float addrspace(1)* %78, align 4, !tbaa !16
  %79 = getelementptr inbounds float, float addrspace(1)* %2, i64 %73
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !16
  %81 = fmul contract float %75, %80
  %82 = fadd contract float %71, %81
  %83 = add nsw i32 %72, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %5, i64 %84
  %86 = load float, float addrspace(1)* %85, align 4, !tbaa !16
  %87 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %88 = fmul contract float %86, %87
  %89 = getelementptr inbounds float, float addrspace(1)* %0, i64 %84
  store float %88, float addrspace(1)* %89, align 4, !tbaa !16
  %90 = getelementptr inbounds float, float addrspace(1)* %2, i64 %84
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !16
  %92 = fmul contract float %86, %91
  %93 = fadd contract float %82, %92
  %94 = add nsw i32 %72, 2
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds float, float addrspace(1)* %5, i64 %95
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !16
  %98 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %99 = fmul contract float %97, %98
  %100 = getelementptr inbounds float, float addrspace(1)* %0, i64 %95
  store float %99, float addrspace(1)* %100, align 4, !tbaa !16
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %95
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16
  %103 = fmul contract float %97, %102
  %104 = fadd contract float %93, %103
  %105 = add nsw i32 %72, 3
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %5, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %110 = fmul contract float %108, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %0, i64 %106
  store float %110, float addrspace(1)* %111, align 4, !tbaa !16
  %112 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %113 = load float, float addrspace(1)* %112, align 4, !tbaa !16
  %114 = fmul contract float %108, %113
  %115 = fadd contract float %104, %114
  %116 = add nsw i32 %72, 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds float, float addrspace(1)* %5, i64 %117
  %119 = load float, float addrspace(1)* %118, align 4, !tbaa !16
  %120 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %121 = fmul contract float %119, %120
  %122 = getelementptr inbounds float, float addrspace(1)* %0, i64 %117
  store float %121, float addrspace(1)* %122, align 4, !tbaa !16
  %123 = getelementptr inbounds float, float addrspace(1)* %2, i64 %117
  %124 = load float, float addrspace(1)* %123, align 4, !tbaa !16
  %125 = fmul contract float %119, %124
  %126 = fadd contract float %115, %125
  %127 = add nsw i32 %72, 5
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %5, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !16
  %131 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %132 = fmul contract float %130, %131
  %133 = getelementptr inbounds float, float addrspace(1)* %0, i64 %128
  store float %132, float addrspace(1)* %133, align 4, !tbaa !16
  %134 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !16
  %136 = fmul contract float %130, %135
  %137 = fadd contract float %126, %136
  %138 = add nsw i32 %72, 6
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %5, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !16
  %142 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %143 = fmul contract float %141, %142
  %144 = getelementptr inbounds float, float addrspace(1)* %0, i64 %139
  store float %143, float addrspace(1)* %144, align 4, !tbaa !16
  %145 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !16
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %137, %147
  %149 = add nsw i32 %72, 7
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds float, float addrspace(1)* %5, i64 %150
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !16
  %153 = load float, float addrspace(1)* %38, align 4, !tbaa !16
  %154 = fmul contract float %152, %153
  %155 = getelementptr inbounds float, float addrspace(1)* %0, i64 %150
  store float %154, float addrspace(1)* %155, align 4, !tbaa !16
  %156 = getelementptr inbounds float, float addrspace(1)* %2, i64 %150
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !16
  %158 = fmul contract float %152, %157
  %159 = fadd contract float %148, %158
  %160 = add nsw i32 %72, 8
  %161 = icmp eq i32 %160, %34
  br i1 %161, label %64, label %70, !llvm.loop !22

162:                                              ; preds = %64, %8
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
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}

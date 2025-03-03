; ModuleID = '../data/hip_kernels/12582/1/main.cu'
source_filename = "../data/hip_kernels/12582/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z26conv_vertical_naive_outputiPfPKfS1_iii(i32 %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = getelementptr inbounds i8, i8 addrspace(4)* %9, i64 12
  %15 = bitcast i8 addrspace(4)* %14 to i32 addrspace(4)*
  %16 = load i32, i32 addrspace(4)* %15, align 4, !tbaa !6
  %17 = mul i32 %8, %13
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %19 = add i32 %17, %18
  %20 = icmp slt i32 %19, %0
  br i1 %20, label %21, label %36

21:                                               ; preds = %7
  %22 = add i32 %4, 1
  %23 = sub i32 %22, %6
  %24 = mul nsw i32 %23, %5
  %25 = icmp sgt i32 %6, 0
  %26 = udiv i32 %16, %13
  %27 = mul i32 %26, %13
  %28 = icmp ugt i32 %16, %27
  %29 = zext i1 %28 to i32
  %30 = add i32 %26, %29
  %31 = mul i32 %30, %13
  %32 = and i32 %6, 3
  %33 = icmp ult i32 %6, 4
  %34 = and i32 %6, -4
  %35 = icmp eq i32 %32, 0
  br label %37

36:                                               ; preds = %72, %7
  ret void

37:                                               ; preds = %21, %72
  %38 = phi i32 [ %19, %21 ], [ %73, %72 ]
  %39 = freeze i32 %38
  %40 = freeze i32 %24
  %41 = sdiv i32 %39, %40
  %42 = mul i32 %41, %4
  %43 = mul i32 %41, %40
  %44 = sub i32 %39, %43
  %45 = mul nsw i32 %41, %6
  br i1 %25, label %46, label %72

46:                                               ; preds = %37
  %47 = sext i32 %38 to i64
  %48 = getelementptr inbounds float, float addrspace(1)* %1, i64 %47
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !16
  br i1 %33, label %50, label %75

50:                                               ; preds = %75, %46
  %51 = phi float [ %49, %46 ], [ %129, %75 ]
  %52 = phi i32 [ 0, %46 ], [ %130, %75 ]
  br i1 %35, label %72, label %53

53:                                               ; preds = %50, %53
  %54 = phi float [ %68, %53 ], [ %51, %50 ]
  %55 = phi i32 [ %69, %53 ], [ %52, %50 ]
  %56 = phi i32 [ %70, %53 ], [ 0, %50 ]
  %57 = add nsw i32 %55, %45
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %3, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !16
  %61 = add i32 %55, %42
  %62 = mul i32 %61, %5
  %63 = add i32 %62, %44
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !16
  %67 = fmul contract float %60, %66
  %68 = fadd contract float %54, %67
  store float %68, float addrspace(1)* %48, align 4, !tbaa !16
  %69 = add nuw nsw i32 %55, 1
  %70 = add i32 %56, 1
  %71 = icmp eq i32 %70, %32
  br i1 %71, label %72, label %53, !llvm.loop !20

72:                                               ; preds = %50, %53, %37
  %73 = add i32 %31, %38
  %74 = icmp slt i32 %73, %0
  br i1 %74, label %37, label %36, !llvm.loop !22

75:                                               ; preds = %46, %75
  %76 = phi float [ %129, %75 ], [ %49, %46 ]
  %77 = phi i32 [ %130, %75 ], [ 0, %46 ]
  %78 = phi i32 [ %131, %75 ], [ 0, %46 ]
  %79 = add nsw i32 %77, %45
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !16
  %83 = add i32 %77, %42
  %84 = mul i32 %83, %5
  %85 = add i32 %84, %44
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds float, float addrspace(1)* %2, i64 %86
  %88 = load float, float addrspace(1)* %87, align 4, !tbaa !16
  %89 = fmul contract float %82, %88
  %90 = fadd contract float %76, %89
  store float %90, float addrspace(1)* %48, align 4, !tbaa !16
  %91 = or i32 %77, 1
  %92 = add nsw i32 %91, %45
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %3, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !16
  %96 = add i32 %91, %42
  %97 = mul i32 %96, %5
  %98 = add i32 %97, %44
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %2, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !16
  %102 = fmul contract float %95, %101
  %103 = fadd contract float %90, %102
  store float %103, float addrspace(1)* %48, align 4, !tbaa !16
  %104 = or i32 %77, 2
  %105 = add nsw i32 %104, %45
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %3, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16
  %109 = add i32 %104, %42
  %110 = mul i32 %109, %5
  %111 = add i32 %110, %44
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16
  %115 = fmul contract float %108, %114
  %116 = fadd contract float %103, %115
  store float %116, float addrspace(1)* %48, align 4, !tbaa !16
  %117 = or i32 %77, 3
  %118 = add nsw i32 %117, %45
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %3, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !16
  %122 = add i32 %117, %42
  %123 = mul i32 %122, %5
  %124 = add i32 %123, %44
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds float, float addrspace(1)* %2, i64 %125
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !16
  %128 = fmul contract float %121, %127
  %129 = fadd contract float %116, %128
  store float %129, float addrspace(1)* %48, align 4, !tbaa !16
  %130 = add nuw nsw i32 %77, 4
  %131 = add i32 %78, 4
  %132 = icmp eq i32 %131, %34
  br i1 %132, label %50, label %75, !llvm.loop !24
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!24 = distinct !{!24, !23}

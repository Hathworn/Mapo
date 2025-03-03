; ModuleID = '../data/hip_kernels/1240/5/main.cu'
source_filename = "../data/hip_kernels/1240/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z14reprojectPointPdiiS_S_iii(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, double addrspace(1)* nocapture %3, double addrspace(1)* nocapture readonly %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = getelementptr inbounds i8, i8 addrspace(4)* %10, i64 12
  %16 = bitcast i8 addrspace(4)* %15 to i32 addrspace(4)*
  %17 = load i32, i32 addrspace(4)* %16, align 4, !tbaa !6
  %18 = mul i32 %9, %14
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %20 = add i32 %18, %19
  %21 = udiv i32 %17, %14
  %22 = mul i32 %21, %14
  %23 = icmp ugt i32 %17, %22
  %24 = zext i1 %23 to i32
  %25 = add i32 %21, %24
  %26 = mul i32 %25, %14
  %27 = sub nsw i32 %1, %2
  %28 = icmp slt i32 %20, %27
  br i1 %28, label %29, label %36

29:                                               ; preds = %8
  %30 = mul nsw i32 %7, %1
  %31 = icmp sgt i32 %1, 0
  %32 = and i32 %1, 3
  %33 = icmp ult i32 %1, 4
  %34 = and i32 %1, -4
  %35 = icmp eq i32 %32, 0
  br label %37

36:                                               ; preds = %65, %8
  ret void

37:                                               ; preds = %29, %65
  %38 = phi i32 [ %20, %29 ], [ %66, %65 ]
  %39 = add nsw i32 %38, %30
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %3, i64 %40
  store double 0.000000e+00, double addrspace(1)* %41, align 8, !tbaa !16
  br i1 %31, label %42, label %65

42:                                               ; preds = %37
  %43 = mul nsw i32 %38, %1
  br i1 %33, label %44, label %68

44:                                               ; preds = %68, %42
  %45 = phi double [ 0.000000e+00, %42 ], [ %118, %68 ]
  %46 = phi i32 [ 0, %42 ], [ %119, %68 ]
  br i1 %35, label %65, label %47

47:                                               ; preds = %44, %47
  %48 = phi double [ %61, %47 ], [ %45, %44 ]
  %49 = phi i32 [ %62, %47 ], [ %46, %44 ]
  %50 = phi i32 [ %63, %47 ], [ 0, %44 ]
  %51 = add nsw i32 %49, %43
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !16
  %55 = mul nsw i32 %49, %5
  %56 = add nsw i32 %55, %6
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %4, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16
  %60 = fmul contract double %54, %59
  %61 = fadd contract double %48, %60
  store double %61, double addrspace(1)* %41, align 8, !tbaa !16
  %62 = add nuw nsw i32 %49, 1
  %63 = add i32 %50, 1
  %64 = icmp eq i32 %63, %32
  br i1 %64, label %65, label %47, !llvm.loop !20

65:                                               ; preds = %44, %47, %37
  %66 = add nsw i32 %38, %26
  %67 = icmp slt i32 %66, %27
  br i1 %67, label %37, label %36, !llvm.loop !22

68:                                               ; preds = %42, %68
  %69 = phi double [ %118, %68 ], [ 0.000000e+00, %42 ]
  %70 = phi i32 [ %119, %68 ], [ 0, %42 ]
  %71 = phi i32 [ %120, %68 ], [ 0, %42 ]
  %72 = add nsw i32 %70, %43
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !16
  %76 = mul nsw i32 %70, %5
  %77 = add nsw i32 %76, %6
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %4, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !16
  %81 = fmul contract double %75, %80
  %82 = fadd contract double %69, %81
  store double %82, double addrspace(1)* %41, align 8, !tbaa !16
  %83 = or i32 %70, 1
  %84 = add nsw i32 %83, %43
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %0, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !16
  %88 = mul nsw i32 %83, %5
  %89 = add nsw i32 %88, %6
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %4, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !16
  %93 = fmul contract double %87, %92
  %94 = fadd contract double %82, %93
  store double %94, double addrspace(1)* %41, align 8, !tbaa !16
  %95 = or i32 %70, 2
  %96 = add nsw i32 %95, %43
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double addrspace(1)* %0, i64 %97
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %100 = mul nsw i32 %95, %5
  %101 = add nsw i32 %100, %6
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double addrspace(1)* %4, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !16
  %105 = fmul contract double %99, %104
  %106 = fadd contract double %94, %105
  store double %106, double addrspace(1)* %41, align 8, !tbaa !16
  %107 = or i32 %70, 3
  %108 = add nsw i32 %107, %43
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !16
  %112 = mul nsw i32 %107, %5
  %113 = add nsw i32 %112, %6
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double addrspace(1)* %4, i64 %114
  %116 = load double, double addrspace(1)* %115, align 8, !tbaa !16
  %117 = fmul contract double %111, %116
  %118 = fadd contract double %106, %117
  store double %118, double addrspace(1)* %41, align 8, !tbaa !16
  %119 = add nuw nsw i32 %70, 4
  %120 = add i32 %71, 4
  %121 = icmp eq i32 %120, %34
  br i1 %121, label %44, label %68, !llvm.loop !24
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !23}

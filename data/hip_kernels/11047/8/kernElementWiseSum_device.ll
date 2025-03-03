; ModuleID = '../data/hip_kernels/11047/8/main.cu'
source_filename = "../data/hip_kernels/11047/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z18kernElementWiseSummmPdS_(i64 %0, i64 %1, double addrspace(1)* nocapture %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = mul i32 %18, %5
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = add i32 %19, %20
  %22 = mul i32 %21, %13
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %24 = add i32 %22, %23
  %25 = sext i32 %24 to i64
  %26 = icmp ult i64 %25, %0
  br i1 %26, label %27, label %104

27:                                               ; preds = %4
  %28 = mul i64 %25, %1
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  %30 = getelementptr inbounds double, double addrspace(1)* %3, i64 %28
  %31 = icmp eq i64 %1, 0
  br i1 %31, label %104, label %32

32:                                               ; preds = %27
  %33 = and i64 %1, 7
  %34 = icmp ult i64 %1, 8
  br i1 %34, label %90, label %35

35:                                               ; preds = %32
  %36 = and i64 %1, -8
  br label %37

37:                                               ; preds = %37, %35
  %38 = phi i64 [ 0, %35 ], [ %87, %37 ]
  %39 = phi i64 [ 0, %35 ], [ %88, %37 ]
  %40 = getelementptr inbounds double, double addrspace(1)* %30, i64 %38
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !16
  %42 = getelementptr inbounds double, double addrspace(1)* %29, i64 %38
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !16
  %44 = fadd contract double %41, %43
  store double %44, double addrspace(1)* %42, align 8, !tbaa !16
  %45 = or i64 %38, 1
  %46 = getelementptr inbounds double, double addrspace(1)* %30, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !16
  %48 = getelementptr inbounds double, double addrspace(1)* %29, i64 %45
  %49 = load double, double addrspace(1)* %48, align 8, !tbaa !16
  %50 = fadd contract double %47, %49
  store double %50, double addrspace(1)* %48, align 8, !tbaa !16
  %51 = or i64 %38, 2
  %52 = getelementptr inbounds double, double addrspace(1)* %30, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !16
  %54 = getelementptr inbounds double, double addrspace(1)* %29, i64 %51
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !16
  %56 = fadd contract double %53, %55
  store double %56, double addrspace(1)* %54, align 8, !tbaa !16
  %57 = or i64 %38, 3
  %58 = getelementptr inbounds double, double addrspace(1)* %30, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !16
  %60 = getelementptr inbounds double, double addrspace(1)* %29, i64 %57
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !16
  %62 = fadd contract double %59, %61
  store double %62, double addrspace(1)* %60, align 8, !tbaa !16
  %63 = or i64 %38, 4
  %64 = getelementptr inbounds double, double addrspace(1)* %30, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !16
  %66 = getelementptr inbounds double, double addrspace(1)* %29, i64 %63
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !16
  %68 = fadd contract double %65, %67
  store double %68, double addrspace(1)* %66, align 8, !tbaa !16
  %69 = or i64 %38, 5
  %70 = getelementptr inbounds double, double addrspace(1)* %30, i64 %69
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !16
  %72 = getelementptr inbounds double, double addrspace(1)* %29, i64 %69
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !16
  %74 = fadd contract double %71, %73
  store double %74, double addrspace(1)* %72, align 8, !tbaa !16
  %75 = or i64 %38, 6
  %76 = getelementptr inbounds double, double addrspace(1)* %30, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !16
  %78 = getelementptr inbounds double, double addrspace(1)* %29, i64 %75
  %79 = load double, double addrspace(1)* %78, align 8, !tbaa !16
  %80 = fadd contract double %77, %79
  store double %80, double addrspace(1)* %78, align 8, !tbaa !16
  %81 = or i64 %38, 7
  %82 = getelementptr inbounds double, double addrspace(1)* %30, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !16
  %84 = getelementptr inbounds double, double addrspace(1)* %29, i64 %81
  %85 = load double, double addrspace(1)* %84, align 8, !tbaa !16
  %86 = fadd contract double %83, %85
  store double %86, double addrspace(1)* %84, align 8, !tbaa !16
  %87 = add nuw i64 %38, 8
  %88 = add i64 %39, 8
  %89 = icmp eq i64 %88, %36
  br i1 %89, label %90, label %37, !llvm.loop !20

90:                                               ; preds = %37, %32
  %91 = phi i64 [ 0, %32 ], [ %87, %37 ]
  %92 = icmp eq i64 %33, 0
  br i1 %92, label %104, label %93

93:                                               ; preds = %90, %93
  %94 = phi i64 [ %101, %93 ], [ %91, %90 ]
  %95 = phi i64 [ %102, %93 ], [ 0, %90 ]
  %96 = getelementptr inbounds double, double addrspace(1)* %30, i64 %94
  %97 = load double, double addrspace(1)* %96, align 8, !tbaa !16
  %98 = getelementptr inbounds double, double addrspace(1)* %29, i64 %94
  %99 = load double, double addrspace(1)* %98, align 8, !tbaa !16
  %100 = fadd contract double %97, %99
  store double %100, double addrspace(1)* %98, align 8, !tbaa !16
  %101 = add nuw i64 %94, 1
  %102 = add i64 %95, 1
  %103 = icmp eq i64 %102, %33
  br i1 %103, label %104, label %93, !llvm.loop !22

104:                                              ; preds = %90, %93, %27, %4
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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}

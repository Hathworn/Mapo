; ModuleID = '../data/hip_kernels/1240/6/main.cu'
source_filename = "../data/hip_kernels/1240/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15reprojectPoint2PdiiS_S_iii(double addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture %4, i32 %5, i32 %6, i32 %7) local_unnamed_addr #0 {
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
  %27 = icmp slt i32 %20, %1
  br i1 %27, label %28, label %38

28:                                               ; preds = %8
  %29 = sub nsw i32 %1, %2
  %30 = icmp sgt i32 %29, 0
  %31 = mul nsw i32 %7, %1
  %32 = xor i32 %2, -1
  %33 = add i32 %32, %1
  %34 = and i32 %29, 3
  %35 = icmp ult i32 %33, 3
  %36 = and i32 %29, -4
  %37 = icmp eq i32 %34, 0
  br label %39

38:                                               ; preds = %67, %8
  ret void

39:                                               ; preds = %28, %67
  %40 = phi i32 [ %20, %28 ], [ %68, %67 ]
  %41 = mul nsw i32 %40, %5
  %42 = add nsw i32 %41, %6
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %4, i64 %43
  store double 0.000000e+00, double addrspace(1)* %44, align 8, !tbaa !16
  br i1 %30, label %45, label %67

45:                                               ; preds = %39
  br i1 %35, label %46, label %70

46:                                               ; preds = %70, %45
  %47 = phi double [ 0.000000e+00, %45 ], [ %120, %70 ]
  %48 = phi i32 [ 0, %45 ], [ %121, %70 ]
  br i1 %37, label %67, label %49

49:                                               ; preds = %46, %49
  %50 = phi double [ %63, %49 ], [ %47, %46 ]
  %51 = phi i32 [ %64, %49 ], [ %48, %46 ]
  %52 = phi i32 [ %65, %49 ], [ 0, %46 ]
  %53 = mul nsw i32 %51, %1
  %54 = add nsw i32 %53, %40
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !16
  %58 = add nsw i32 %51, %31
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %3, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !16
  %62 = fmul contract double %57, %61
  %63 = fadd contract double %50, %62
  store double %63, double addrspace(1)* %44, align 8, !tbaa !16
  %64 = add nuw nsw i32 %51, 1
  %65 = add i32 %52, 1
  %66 = icmp eq i32 %65, %34
  br i1 %66, label %67, label %49, !llvm.loop !20

67:                                               ; preds = %46, %49, %39
  %68 = add nsw i32 %40, %26
  %69 = icmp slt i32 %68, %1
  br i1 %69, label %39, label %38, !llvm.loop !22

70:                                               ; preds = %45, %70
  %71 = phi double [ %120, %70 ], [ 0.000000e+00, %45 ]
  %72 = phi i32 [ %121, %70 ], [ 0, %45 ]
  %73 = phi i32 [ %122, %70 ], [ 0, %45 ]
  %74 = mul nsw i32 %72, %1
  %75 = add nsw i32 %74, %40
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !16
  %79 = add nsw i32 %72, %31
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %3, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !16
  %83 = fmul contract double %78, %82
  %84 = fadd contract double %71, %83
  store double %84, double addrspace(1)* %44, align 8, !tbaa !16
  %85 = or i32 %72, 1
  %86 = mul nsw i32 %85, %1
  %87 = add nsw i32 %86, %40
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds double, double addrspace(1)* %0, i64 %88
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !16
  %91 = add nsw i32 %85, %31
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %3, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !16
  %95 = fmul contract double %90, %94
  %96 = fadd contract double %84, %95
  store double %96, double addrspace(1)* %44, align 8, !tbaa !16
  %97 = or i32 %72, 2
  %98 = mul nsw i32 %97, %1
  %99 = add nsw i32 %98, %40
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds double, double addrspace(1)* %0, i64 %100
  %102 = load double, double addrspace(1)* %101, align 8, !tbaa !16
  %103 = add nsw i32 %97, %31
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double addrspace(1)* %3, i64 %104
  %106 = load double, double addrspace(1)* %105, align 8, !tbaa !16
  %107 = fmul contract double %102, %106
  %108 = fadd contract double %96, %107
  store double %108, double addrspace(1)* %44, align 8, !tbaa !16
  %109 = or i32 %72, 3
  %110 = mul nsw i32 %109, %1
  %111 = add nsw i32 %110, %40
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %0, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !16
  %115 = add nsw i32 %109, %31
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds double, double addrspace(1)* %3, i64 %116
  %118 = load double, double addrspace(1)* %117, align 8, !tbaa !16
  %119 = fmul contract double %114, %118
  %120 = fadd contract double %108, %119
  store double %120, double addrspace(1)* %44, align 8, !tbaa !16
  %121 = add nuw nsw i32 %72, 4
  %122 = add i32 %73, 4
  %123 = icmp eq i32 %122, %36
  br i1 %123, label %46, label %70, !llvm.loop !24
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

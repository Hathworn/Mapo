; ModuleID = '../data/hip_kernels/2482/6/main.cu'
source_filename = "../data/hip_kernels/2482/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z8vecAdd_3PdS_S_i(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = icmp sgt i32 %3, 0
  br i1 %6, label %7, label %30

7:                                                ; preds = %4
  %8 = and i32 %3, 7
  %9 = icmp ult i32 %3, 8
  br i1 %9, label %12, label %10

10:                                               ; preds = %7
  %11 = and i32 %3, -8
  br label %31

12:                                               ; preds = %31, %7
  %13 = phi i32 [ 0, %7 ], [ %113, %31 ]
  %14 = icmp eq i32 %8, 0
  br i1 %14, label %30, label %15

15:                                               ; preds = %12, %15
  %16 = phi i32 [ %27, %15 ], [ %13, %12 ]
  %17 = phi i32 [ %28, %15 ], [ 0, %12 ]
  %18 = mul nsw i32 %16, %3
  %19 = add nsw i32 %18, %5
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds double, double addrspace(1)* %0, i64 %20
  %22 = load double, double addrspace(1)* %21, align 8, !tbaa !5
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %20
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !5
  %25 = fadd contract double %22, %24
  %26 = getelementptr inbounds double, double addrspace(1)* %2, i64 %20
  store double %25, double addrspace(1)* %26, align 8, !tbaa !5
  %27 = add nuw nsw i32 %16, 1
  %28 = add i32 %17, 1
  %29 = icmp eq i32 %28, %8
  br i1 %29, label %30, label %15, !llvm.loop !9

30:                                               ; preds = %12, %15, %4
  ret void

31:                                               ; preds = %31, %10
  %32 = phi i32 [ 0, %10 ], [ %113, %31 ]
  %33 = phi i32 [ 0, %10 ], [ %114, %31 ]
  %34 = mul nsw i32 %32, %3
  %35 = add nsw i32 %34, %5
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !5
  %39 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !5
  %41 = fadd contract double %38, %40
  %42 = getelementptr inbounds double, double addrspace(1)* %2, i64 %36
  store double %41, double addrspace(1)* %42, align 8, !tbaa !5
  %43 = or i32 %32, 1
  %44 = mul nsw i32 %43, %3
  %45 = add nsw i32 %44, %5
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !5
  %49 = getelementptr inbounds double, double addrspace(1)* %1, i64 %46
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !5
  %51 = fadd contract double %48, %50
  %52 = getelementptr inbounds double, double addrspace(1)* %2, i64 %46
  store double %51, double addrspace(1)* %52, align 8, !tbaa !5
  %53 = or i32 %32, 2
  %54 = mul nsw i32 %53, %3
  %55 = add nsw i32 %54, %5
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !5
  %59 = getelementptr inbounds double, double addrspace(1)* %1, i64 %56
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !5
  %61 = fadd contract double %58, %60
  %62 = getelementptr inbounds double, double addrspace(1)* %2, i64 %56
  store double %61, double addrspace(1)* %62, align 8, !tbaa !5
  %63 = or i32 %32, 3
  %64 = mul nsw i32 %63, %3
  %65 = add nsw i32 %64, %5
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !5
  %69 = getelementptr inbounds double, double addrspace(1)* %1, i64 %66
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !5
  %71 = fadd contract double %68, %70
  %72 = getelementptr inbounds double, double addrspace(1)* %2, i64 %66
  store double %71, double addrspace(1)* %72, align 8, !tbaa !5
  %73 = or i32 %32, 4
  %74 = mul nsw i32 %73, %3
  %75 = add nsw i32 %74, %5
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !5
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 %76
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !5
  %81 = fadd contract double %78, %80
  %82 = getelementptr inbounds double, double addrspace(1)* %2, i64 %76
  store double %81, double addrspace(1)* %82, align 8, !tbaa !5
  %83 = or i32 %32, 5
  %84 = mul nsw i32 %83, %3
  %85 = add nsw i32 %84, %5
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double addrspace(1)* %0, i64 %86
  %88 = load double, double addrspace(1)* %87, align 8, !tbaa !5
  %89 = getelementptr inbounds double, double addrspace(1)* %1, i64 %86
  %90 = load double, double addrspace(1)* %89, align 8, !tbaa !5
  %91 = fadd contract double %88, %90
  %92 = getelementptr inbounds double, double addrspace(1)* %2, i64 %86
  store double %91, double addrspace(1)* %92, align 8, !tbaa !5
  %93 = or i32 %32, 6
  %94 = mul nsw i32 %93, %3
  %95 = add nsw i32 %94, %5
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds double, double addrspace(1)* %0, i64 %96
  %98 = load double, double addrspace(1)* %97, align 8, !tbaa !5
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %96
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !5
  %101 = fadd contract double %98, %100
  %102 = getelementptr inbounds double, double addrspace(1)* %2, i64 %96
  store double %101, double addrspace(1)* %102, align 8, !tbaa !5
  %103 = or i32 %32, 7
  %104 = mul nsw i32 %103, %3
  %105 = add nsw i32 %104, %5
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds double, double addrspace(1)* %0, i64 %106
  %108 = load double, double addrspace(1)* %107, align 8, !tbaa !5
  %109 = getelementptr inbounds double, double addrspace(1)* %1, i64 %106
  %110 = load double, double addrspace(1)* %109, align 8, !tbaa !5
  %111 = fadd contract double %108, %110
  %112 = getelementptr inbounds double, double addrspace(1)* %2, i64 %106
  store double %111, double addrspace(1)* %112, align 8, !tbaa !5
  %113 = add nuw nsw i32 %32, 8
  %114 = add i32 %33, 8
  %115 = icmp eq i32 %114, %11
  br i1 %115, label %12, label %31, !llvm.loop !11
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}

; ModuleID = '../data/hip_kernels/4610/4/main.cu'
source_filename = "../data/hip_kernels/4610/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z5atempPdS_S_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, double addrspace(1)* nocapture readonly %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = icmp sle i32 %14, %4
  %16 = icmp sgt i32 %3, 0
  %17 = select i1 %15, i1 %16, i1 false
  br i1 %17, label %18, label %141

18:                                               ; preds = %5
  %19 = sext i32 %14 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %1, i64 %19
  %21 = load double, double addrspace(1)* %20, align 8, !tbaa !7
  %22 = and i32 %3, 7
  %23 = icmp ult i32 %3, 8
  br i1 %23, label %120, label %24

24:                                               ; preds = %18
  %25 = and i32 %3, -8
  br label %26

26:                                               ; preds = %26, %24
  %27 = phi double [ %21, %24 ], [ %116, %26 ]
  %28 = phi i32 [ 0, %24 ], [ %117, %26 ]
  %29 = phi i32 [ 0, %24 ], [ %118, %26 ]
  %30 = mul nsw i32 %28, %4
  %31 = add nsw i32 %30, %14
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %0, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7
  %35 = zext i32 %28 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %2, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7
  %38 = fmul contract double %34, %37
  %39 = fadd contract double %27, %38
  store double %39, double addrspace(1)* %20, align 8, !tbaa !7
  %40 = or i32 %28, 1
  %41 = mul nsw i32 %40, %4
  %42 = add nsw i32 %41, %14
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7
  %46 = zext i32 %40 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %2, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7
  %49 = fmul contract double %45, %48
  %50 = fadd contract double %39, %49
  store double %50, double addrspace(1)* %20, align 8, !tbaa !7
  %51 = or i32 %28, 2
  %52 = mul nsw i32 %51, %4
  %53 = add nsw i32 %52, %14
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %57 = zext i32 %51 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %2, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = fmul contract double %56, %59
  %61 = fadd contract double %50, %60
  store double %61, double addrspace(1)* %20, align 8, !tbaa !7
  %62 = or i32 %28, 3
  %63 = mul nsw i32 %62, %4
  %64 = add nsw i32 %63, %14
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7
  %68 = zext i32 %62 to i64
  %69 = getelementptr inbounds double, double addrspace(1)* %2, i64 %68
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !7
  %71 = fmul contract double %67, %70
  %72 = fadd contract double %61, %71
  store double %72, double addrspace(1)* %20, align 8, !tbaa !7
  %73 = or i32 %28, 4
  %74 = mul nsw i32 %73, %4
  %75 = add nsw i32 %74, %14
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds double, double addrspace(1)* %0, i64 %76
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7
  %79 = zext i32 %73 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %2, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7
  %82 = fmul contract double %78, %81
  %83 = fadd contract double %72, %82
  store double %83, double addrspace(1)* %20, align 8, !tbaa !7
  %84 = or i32 %28, 5
  %85 = mul nsw i32 %84, %4
  %86 = add nsw i32 %85, %14
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7
  %90 = zext i32 %84 to i64
  %91 = getelementptr inbounds double, double addrspace(1)* %2, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7
  %93 = fmul contract double %89, %92
  %94 = fadd contract double %83, %93
  store double %94, double addrspace(1)* %20, align 8, !tbaa !7
  %95 = or i32 %28, 6
  %96 = mul nsw i32 %95, %4
  %97 = add nsw i32 %96, %14
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %0, i64 %98
  %100 = load double, double addrspace(1)* %99, align 8, !tbaa !7
  %101 = zext i32 %95 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %2, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = fmul contract double %100, %103
  %105 = fadd contract double %94, %104
  store double %105, double addrspace(1)* %20, align 8, !tbaa !7
  %106 = or i32 %28, 7
  %107 = mul nsw i32 %106, %4
  %108 = add nsw i32 %107, %14
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double addrspace(1)* %0, i64 %109
  %111 = load double, double addrspace(1)* %110, align 8, !tbaa !7
  %112 = zext i32 %106 to i64
  %113 = getelementptr inbounds double, double addrspace(1)* %2, i64 %112
  %114 = load double, double addrspace(1)* %113, align 8, !tbaa !7
  %115 = fmul contract double %111, %114
  %116 = fadd contract double %105, %115
  store double %116, double addrspace(1)* %20, align 8, !tbaa !7
  %117 = add nuw nsw i32 %28, 8
  %118 = add i32 %29, 8
  %119 = icmp eq i32 %118, %25
  br i1 %119, label %120, label %26, !llvm.loop !11

120:                                              ; preds = %26, %18
  %121 = phi double [ %21, %18 ], [ %116, %26 ]
  %122 = phi i32 [ 0, %18 ], [ %117, %26 ]
  %123 = icmp eq i32 %22, 0
  br i1 %123, label %141, label %124

124:                                              ; preds = %120, %124
  %125 = phi double [ %137, %124 ], [ %121, %120 ]
  %126 = phi i32 [ %138, %124 ], [ %122, %120 ]
  %127 = phi i32 [ %139, %124 ], [ 0, %120 ]
  %128 = mul nsw i32 %126, %4
  %129 = add nsw i32 %128, %14
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds double, double addrspace(1)* %0, i64 %130
  %132 = load double, double addrspace(1)* %131, align 8, !tbaa !7
  %133 = zext i32 %126 to i64
  %134 = getelementptr inbounds double, double addrspace(1)* %2, i64 %133
  %135 = load double, double addrspace(1)* %134, align 8, !tbaa !7
  %136 = fmul contract double %132, %135
  %137 = fadd contract double %125, %136
  store double %137, double addrspace(1)* %20, align 8, !tbaa !7
  %138 = add nuw nsw i32 %126, 1
  %139 = add i32 %127, 1
  %140 = icmp eq i32 %139, %22
  br i1 %140, label %141, label %124, !llvm.loop !13

141:                                              ; preds = %120, %124, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}

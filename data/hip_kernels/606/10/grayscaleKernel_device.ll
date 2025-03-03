; ModuleID = '../data/hip_kernels/606/10/main.cu'
source_filename = "../data/hip_kernels/606/10/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15grayscaleKernelPiS_i(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp slt i32 %12, %2
  %14 = icmp sgt i32 %2, 3
  %15 = and i1 %13, %14
  br i1 %15, label %16, label %108

16:                                               ; preds = %3
  %17 = mul nsw i32 %12, %2
  %18 = add i32 %2, -4
  %19 = udiv i32 %18, 3
  %20 = add nuw nsw i32 %19, 1
  %21 = and i32 %20, 1
  %22 = icmp ult i32 %18, 3
  br i1 %22, label %80, label %23

23:                                               ; preds = %16
  %24 = and i32 %20, -2
  br label %25

25:                                               ; preds = %25, %23
  %26 = phi i32 [ 0, %23 ], [ %77, %25 ]
  %27 = phi i32 [ 0, %23 ], [ %78, %25 ]
  %28 = add nsw i32 %26, %17
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %29
  %31 = load i32, i32 addrspace(1)* %30, align 4, !tbaa !7
  %32 = sitofp i32 %31 to double
  %33 = fmul contract double %32, 2.990000e-01
  %34 = add nsw i32 %28, 1
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %35
  %37 = load i32, i32 addrspace(1)* %36, align 4, !tbaa !7
  %38 = sitofp i32 %37 to double
  %39 = fmul contract double %38, 5.876000e-01
  %40 = fadd contract double %33, %39
  %41 = add nsw i32 %28, 2
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = load i32, i32 addrspace(1)* %43, align 4, !tbaa !7
  %45 = sitofp i32 %44 to double
  %46 = fmul contract double %45, 1.140000e-01
  %47 = fadd contract double %40, %46
  %48 = fptosi double %47 to i32
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %42
  store i32 %48, i32 addrspace(1)* %49, align 4, !tbaa !7
  %50 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %35
  store i32 %48, i32 addrspace(1)* %50, align 4, !tbaa !7
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %29
  store i32 %48, i32 addrspace(1)* %51, align 4, !tbaa !7
  %52 = add nuw nsw i32 %26, 3
  %53 = add nsw i32 %52, %17
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %54
  %56 = load i32, i32 addrspace(1)* %55, align 4, !tbaa !7
  %57 = sitofp i32 %56 to double
  %58 = fmul contract double %57, 2.990000e-01
  %59 = add nsw i32 %53, 1
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = sitofp i32 %62 to double
  %64 = fmul contract double %63, 5.876000e-01
  %65 = fadd contract double %58, %64
  %66 = add nsw i32 %53, 2
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %67
  %69 = load i32, i32 addrspace(1)* %68, align 4, !tbaa !7
  %70 = sitofp i32 %69 to double
  %71 = fmul contract double %70, 1.140000e-01
  %72 = fadd contract double %65, %71
  %73 = fptosi double %72 to i32
  %74 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %67
  store i32 %73, i32 addrspace(1)* %74, align 4, !tbaa !7
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  store i32 %73, i32 addrspace(1)* %75, align 4, !tbaa !7
  %76 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %54
  store i32 %73, i32 addrspace(1)* %76, align 4, !tbaa !7
  %77 = add nuw nsw i32 %26, 6
  %78 = add i32 %27, 2
  %79 = icmp eq i32 %78, %24
  br i1 %79, label %80, label %25, !llvm.loop !11

80:                                               ; preds = %25, %16
  %81 = phi i32 [ 0, %16 ], [ %77, %25 ]
  %82 = icmp eq i32 %21, 0
  br i1 %82, label %108, label %83

83:                                               ; preds = %80
  %84 = add nsw i32 %81, %17
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %85
  %87 = load i32, i32 addrspace(1)* %86, align 4, !tbaa !7
  %88 = sitofp i32 %87 to double
  %89 = fmul contract double %88, 2.990000e-01
  %90 = add nsw i32 %84, 1
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  %93 = load i32, i32 addrspace(1)* %92, align 4, !tbaa !7
  %94 = sitofp i32 %93 to double
  %95 = fmul contract double %94, 5.876000e-01
  %96 = fadd contract double %89, %95
  %97 = add nsw i32 %84, 2
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %98
  %100 = load i32, i32 addrspace(1)* %99, align 4, !tbaa !7
  %101 = sitofp i32 %100 to double
  %102 = fmul contract double %101, 1.140000e-01
  %103 = fadd contract double %96, %102
  %104 = fptosi double %103 to i32
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %98
  store i32 %104, i32 addrspace(1)* %105, align 4, !tbaa !7
  %106 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %91
  store i32 %104, i32 addrspace(1)* %106, align 4, !tbaa !7
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %85
  store i32 %104, i32 addrspace(1)* %107, align 4, !tbaa !7
  br label %108

108:                                              ; preds = %83, %80, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}

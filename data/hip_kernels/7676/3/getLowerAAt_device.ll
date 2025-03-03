; ModuleID = '../data/hip_kernels/7676/3/main.cu'
source_filename = "../data/hip_kernels/7676/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z11getLowerAAtPKdPdmm(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture %1, i64 %2, i64 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = zext i32 %5 to i64
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = zext i32 %15 to i64
  %17 = icmp ult i64 %6, %2
  %18 = icmp ult i64 %16, %2
  %19 = select i1 %17, i1 %18, i1 false
  br i1 %19, label %20, label %129

20:                                               ; preds = %4
  %21 = mul i64 %6, %2
  %22 = add i64 %21, %16
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  store double 0.000000e+00, double addrspace(1)* %23, align 8, !tbaa !7
  %24 = icmp eq i64 %3, 0
  br i1 %24, label %129, label %25

25:                                               ; preds = %20
  %26 = mul i64 %6, %3
  %27 = mul i64 %16, %3
  %28 = and i64 %3, 7
  %29 = icmp ult i64 %3, 8
  br i1 %29, label %110, label %30

30:                                               ; preds = %25
  %31 = and i64 %3, -8
  br label %32

32:                                               ; preds = %32, %30
  %33 = phi double [ 0.000000e+00, %30 ], [ %106, %32 ]
  %34 = phi i64 [ 0, %30 ], [ %107, %32 ]
  %35 = phi i64 [ 0, %30 ], [ %108, %32 ]
  %36 = add i64 %34, %26
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7
  %39 = add i64 %34, %27
  %40 = getelementptr inbounds double, double addrspace(1)* %0, i64 %39
  %41 = load double, double addrspace(1)* %40, align 8, !tbaa !7
  %42 = fmul contract double %38, %41
  %43 = fadd contract double %33, %42
  store double %43, double addrspace(1)* %23, align 8, !tbaa !7
  %44 = or i64 %34, 1
  %45 = add i64 %44, %26
  %46 = getelementptr inbounds double, double addrspace(1)* %0, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7
  %48 = add i64 %44, %27
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7
  %51 = fmul contract double %47, %50
  %52 = fadd contract double %43, %51
  store double %52, double addrspace(1)* %23, align 8, !tbaa !7
  %53 = or i64 %34, 2
  %54 = add i64 %53, %26
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7
  %57 = add i64 %53, %27
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7
  %60 = fmul contract double %56, %59
  %61 = fadd contract double %52, %60
  store double %61, double addrspace(1)* %23, align 8, !tbaa !7
  %62 = or i64 %34, 3
  %63 = add i64 %62, %26
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %63
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7
  %66 = add i64 %62, %27
  %67 = getelementptr inbounds double, double addrspace(1)* %0, i64 %66
  %68 = load double, double addrspace(1)* %67, align 8, !tbaa !7
  %69 = fmul contract double %65, %68
  %70 = fadd contract double %61, %69
  store double %70, double addrspace(1)* %23, align 8, !tbaa !7
  %71 = or i64 %34, 4
  %72 = add i64 %71, %26
  %73 = getelementptr inbounds double, double addrspace(1)* %0, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7
  %75 = add i64 %71, %27
  %76 = getelementptr inbounds double, double addrspace(1)* %0, i64 %75
  %77 = load double, double addrspace(1)* %76, align 8, !tbaa !7
  %78 = fmul contract double %74, %77
  %79 = fadd contract double %70, %78
  store double %79, double addrspace(1)* %23, align 8, !tbaa !7
  %80 = or i64 %34, 5
  %81 = add i64 %80, %26
  %82 = getelementptr inbounds double, double addrspace(1)* %0, i64 %81
  %83 = load double, double addrspace(1)* %82, align 8, !tbaa !7
  %84 = add i64 %80, %27
  %85 = getelementptr inbounds double, double addrspace(1)* %0, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = fmul contract double %83, %86
  %88 = fadd contract double %79, %87
  store double %88, double addrspace(1)* %23, align 8, !tbaa !7
  %89 = or i64 %34, 6
  %90 = add i64 %89, %26
  %91 = getelementptr inbounds double, double addrspace(1)* %0, i64 %90
  %92 = load double, double addrspace(1)* %91, align 8, !tbaa !7
  %93 = add i64 %89, %27
  %94 = getelementptr inbounds double, double addrspace(1)* %0, i64 %93
  %95 = load double, double addrspace(1)* %94, align 8, !tbaa !7
  %96 = fmul contract double %92, %95
  %97 = fadd contract double %88, %96
  store double %97, double addrspace(1)* %23, align 8, !tbaa !7
  %98 = or i64 %34, 7
  %99 = add i64 %98, %26
  %100 = getelementptr inbounds double, double addrspace(1)* %0, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7
  %102 = add i64 %98, %27
  %103 = getelementptr inbounds double, double addrspace(1)* %0, i64 %102
  %104 = load double, double addrspace(1)* %103, align 8, !tbaa !7
  %105 = fmul contract double %101, %104
  %106 = fadd contract double %97, %105
  store double %106, double addrspace(1)* %23, align 8, !tbaa !7
  %107 = add nuw i64 %34, 8
  %108 = add i64 %35, 8
  %109 = icmp eq i64 %108, %31
  br i1 %109, label %110, label %32, !llvm.loop !11

110:                                              ; preds = %32, %25
  %111 = phi double [ 0.000000e+00, %25 ], [ %106, %32 ]
  %112 = phi i64 [ 0, %25 ], [ %107, %32 ]
  %113 = icmp eq i64 %28, 0
  br i1 %113, label %129, label %114

114:                                              ; preds = %110, %114
  %115 = phi double [ %125, %114 ], [ %111, %110 ]
  %116 = phi i64 [ %126, %114 ], [ %112, %110 ]
  %117 = phi i64 [ %127, %114 ], [ 0, %110 ]
  %118 = add i64 %116, %26
  %119 = getelementptr inbounds double, double addrspace(1)* %0, i64 %118
  %120 = load double, double addrspace(1)* %119, align 8, !tbaa !7
  %121 = add i64 %116, %27
  %122 = getelementptr inbounds double, double addrspace(1)* %0, i64 %121
  %123 = load double, double addrspace(1)* %122, align 8, !tbaa !7
  %124 = fmul contract double %120, %123
  %125 = fadd contract double %115, %124
  store double %125, double addrspace(1)* %23, align 8, !tbaa !7
  %126 = add nuw i64 %116, 1
  %127 = add i64 %117, 1
  %128 = icmp eq i64 %127, %28
  br i1 %128, label %129, label %114, !llvm.loop !13

129:                                              ; preds = %110, %114, %20, %4
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

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
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}

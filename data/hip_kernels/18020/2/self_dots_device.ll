; ModuleID = '../data/hip_kernels/18020/2/main.cu'
source_filename = "../data/hip_kernels/18020/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z9self_dotsiiPdS_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp slt i32 %13, %0
  br i1 %14, label %15, label %107

15:                                               ; preds = %4
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %17, label %41

17:                                               ; preds = %15
  %18 = mul nsw i32 %13, %1
  %19 = and i32 %1, 7
  %20 = icmp ult i32 %1, 8
  br i1 %20, label %23, label %21

21:                                               ; preds = %17
  %22 = and i32 %1, -8
  br label %45

23:                                               ; preds = %45, %17
  %24 = phi double [ undef, %17 ], [ %103, %45 ]
  %25 = phi double [ 0.000000e+00, %17 ], [ %103, %45 ]
  %26 = phi i32 [ 0, %17 ], [ %104, %45 ]
  %27 = icmp eq i32 %19, 0
  br i1 %27, label %41, label %28

28:                                               ; preds = %23, %28
  %29 = phi double [ %37, %28 ], [ %25, %23 ]
  %30 = phi i32 [ %38, %28 ], [ %26, %23 ]
  %31 = phi i32 [ %39, %28 ], [ 0, %23 ]
  %32 = add nsw i32 %30, %18
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !5
  %36 = fmul contract double %35, %35
  %37 = fadd contract double %29, %36
  %38 = add nuw nsw i32 %30, 1
  %39 = add i32 %31, 1
  %40 = icmp eq i32 %39, %19
  br i1 %40, label %41, label %28, !llvm.loop !11

41:                                               ; preds = %23, %28, %15
  %42 = phi double [ 0.000000e+00, %15 ], [ %24, %23 ], [ %37, %28 ]
  %43 = sext i32 %13 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %3, i64 %43
  store double %42, double addrspace(1)* %44, align 8, !tbaa !7
  br label %107

45:                                               ; preds = %45, %21
  %46 = phi double [ 0.000000e+00, %21 ], [ %103, %45 ]
  %47 = phi i32 [ 0, %21 ], [ %104, %45 ]
  %48 = phi i32 [ 0, %21 ], [ %105, %45 ]
  %49 = add nsw i32 %47, %18
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %2, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !5
  %53 = fmul contract double %52, %52
  %54 = fadd contract double %46, %53
  %55 = or i32 %47, 1
  %56 = add nsw i32 %55, %18
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %2, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !5
  %60 = fmul contract double %59, %59
  %61 = fadd contract double %54, %60
  %62 = or i32 %47, 2
  %63 = add nsw i32 %62, %18
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %2, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7, !amdgpu.noclobber !5
  %67 = fmul contract double %66, %66
  %68 = fadd contract double %61, %67
  %69 = or i32 %47, 3
  %70 = add nsw i32 %69, %18
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds double, double addrspace(1)* %2, i64 %71
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !7, !amdgpu.noclobber !5
  %74 = fmul contract double %73, %73
  %75 = fadd contract double %68, %74
  %76 = or i32 %47, 4
  %77 = add nsw i32 %76, %18
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double addrspace(1)* %2, i64 %78
  %80 = load double, double addrspace(1)* %79, align 8, !tbaa !7, !amdgpu.noclobber !5
  %81 = fmul contract double %80, %80
  %82 = fadd contract double %75, %81
  %83 = or i32 %47, 5
  %84 = add nsw i32 %83, %18
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %85
  %87 = load double, double addrspace(1)* %86, align 8, !tbaa !7, !amdgpu.noclobber !5
  %88 = fmul contract double %87, %87
  %89 = fadd contract double %82, %88
  %90 = or i32 %47, 6
  %91 = add nsw i32 %90, %18
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds double, double addrspace(1)* %2, i64 %92
  %94 = load double, double addrspace(1)* %93, align 8, !tbaa !7, !amdgpu.noclobber !5
  %95 = fmul contract double %94, %94
  %96 = fadd contract double %89, %95
  %97 = or i32 %47, 7
  %98 = add nsw i32 %97, %18
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds double, double addrspace(1)* %2, i64 %99
  %101 = load double, double addrspace(1)* %100, align 8, !tbaa !7, !amdgpu.noclobber !5
  %102 = fmul contract double %101, %101
  %103 = fadd contract double %96, %102
  %104 = add nuw nsw i32 %47, 8
  %105 = add i32 %48, 8
  %106 = icmp eq i32 %105, %22
  br i1 %106, label %23, label %45, !llvm.loop !13

107:                                              ; preds = %41, %4
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
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}

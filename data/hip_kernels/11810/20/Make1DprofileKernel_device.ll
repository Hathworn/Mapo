; ModuleID = '../data/hip_kernels/11810/20/main.cu'
source_filename = "../data/hip_kernels/11810/20/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z19Make1DprofileKernelPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = icmp slt i32 %13, %3
  br i1 %14, label %15, label %100

15:                                               ; preds = %4
  %16 = icmp sgt i32 %2, 0
  br i1 %16, label %17, label %94

17:                                               ; preds = %15
  %18 = mul nsw i32 %13, %2
  %19 = and i32 %2, 7
  %20 = icmp ult i32 %2, 8
  br i1 %20, label %77, label %21

21:                                               ; preds = %17
  %22 = and i32 %2, -8
  br label %23

23:                                               ; preds = %23, %21
  %24 = phi double [ 0.000000e+00, %21 ], [ %73, %23 ]
  %25 = phi i32 [ 0, %21 ], [ %74, %23 ]
  %26 = phi i32 [ 0, %21 ], [ %75, %23 ]
  %27 = add nsw i32 %25, %18
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %0, i64 %28
  %30 = load double, double addrspace(1)* %29, align 8, !tbaa !7, !amdgpu.noclobber !6
  %31 = fadd contract double %24, %30
  %32 = or i32 %25, 1
  %33 = add nsw i32 %32, %18
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !6
  %37 = fadd contract double %31, %36
  %38 = or i32 %25, 2
  %39 = add nsw i32 %38, %18
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !6
  %43 = fadd contract double %37, %42
  %44 = or i32 %25, 3
  %45 = add nsw i32 %44, %18
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !6
  %49 = fadd contract double %43, %48
  %50 = or i32 %25, 4
  %51 = add nsw i32 %50, %18
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %0, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !6
  %55 = fadd contract double %49, %54
  %56 = or i32 %25, 5
  %57 = add nsw i32 %56, %18
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %0, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !6
  %61 = fadd contract double %55, %60
  %62 = or i32 %25, 6
  %63 = add nsw i32 %62, %18
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double addrspace(1)* %0, i64 %64
  %66 = load double, double addrspace(1)* %65, align 8, !tbaa !7, !amdgpu.noclobber !6
  %67 = fadd contract double %61, %66
  %68 = or i32 %25, 7
  %69 = add nsw i32 %68, %18
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %0, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !6
  %73 = fadd contract double %67, %72
  %74 = add nuw nsw i32 %25, 8
  %75 = add i32 %26, 8
  %76 = icmp eq i32 %75, %22
  br i1 %76, label %77, label %23, !llvm.loop !11

77:                                               ; preds = %23, %17
  %78 = phi double [ undef, %17 ], [ %73, %23 ]
  %79 = phi double [ 0.000000e+00, %17 ], [ %73, %23 ]
  %80 = phi i32 [ 0, %17 ], [ %74, %23 ]
  %81 = icmp eq i32 %19, 0
  br i1 %81, label %94, label %82

82:                                               ; preds = %77, %82
  %83 = phi double [ %90, %82 ], [ %79, %77 ]
  %84 = phi i32 [ %91, %82 ], [ %80, %77 ]
  %85 = phi i32 [ %92, %82 ], [ 0, %77 ]
  %86 = add nsw i32 %84, %18
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  %89 = load double, double addrspace(1)* %88, align 8, !tbaa !7, !amdgpu.noclobber !6
  %90 = fadd contract double %83, %89
  %91 = add nuw nsw i32 %84, 1
  %92 = add i32 %85, 1
  %93 = icmp eq i32 %92, %19
  br i1 %93, label %94, label %82, !llvm.loop !13

94:                                               ; preds = %77, %82, %15
  %95 = phi double [ 0.000000e+00, %15 ], [ %78, %77 ], [ %90, %82 ]
  %96 = sitofp i32 %2 to double
  %97 = fdiv contract double %95, %96
  %98 = sext i32 %13 to i64
  %99 = getelementptr inbounds double, double addrspace(1)* %1, i64 %98
  store double %97, double addrspace(1)* %99, align 8, !tbaa !7
  br label %100

100:                                              ; preds = %94, %4
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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.unroll.disable"}

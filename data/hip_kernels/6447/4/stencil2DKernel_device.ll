; ModuleID = '../data/hip_kernels/6447/4/main.cu'
source_filename = "../data/hip_kernels/6447/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z15stencil2DKernelPdS_iii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul i32 %14, %4
  %16 = add i32 %15, %4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !4, !invariant.load !5
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %24 = add i32 %22, %23
  %25 = mul i32 %24, %4
  %26 = add i32 %25, %4
  %27 = add i32 %15, 1
  %28 = icmp sgt i32 %27, %16
  br i1 %28, label %41, label %29

29:                                               ; preds = %5
  %30 = add i32 %25, 1
  %31 = icmp sgt i32 %30, %26
  %32 = add nsw i32 %2, 2
  br label %36

33:                                               ; preds = %78, %36
  %34 = add i32 %37, 1
  %35 = icmp sgt i32 %34, %16
  br i1 %35, label %41, label %36, !llvm.loop !7

36:                                               ; preds = %29, %33
  %37 = phi i32 [ %27, %29 ], [ %34, %33 ]
  %38 = phi i32 [ %15, %29 ], [ %37, %33 ]
  br i1 %31, label %33, label %39

39:                                               ; preds = %36
  %40 = icmp sgt i32 %37, %2
  br label %42

41:                                               ; preds = %33, %5
  ret void

42:                                               ; preds = %39, %78
  %43 = phi i32 [ %30, %39 ], [ %79, %78 ]
  %44 = phi i32 [ %25, %39 ], [ %43, %78 ]
  %45 = icmp sgt i32 %43, %3
  %46 = select i1 %40, i1 true, i1 %45
  br i1 %46, label %78, label %47

47:                                               ; preds = %42
  %48 = mul nsw i32 %43, %32
  %49 = add i32 %48, %38
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %0, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !9
  %53 = add i32 %49, 2
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !9
  %57 = fadd contract double %52, %56
  %58 = mul nsw i32 %44, %32
  %59 = add nsw i32 %58, %37
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !9
  %63 = fadd contract double %57, %62
  %64 = add i32 %44, 2
  %65 = mul nsw i32 %64, %32
  %66 = add nsw i32 %65, %37
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !9
  %70 = fadd contract double %63, %69
  %71 = add nsw i32 %48, %37
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %0, i64 %72
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !9
  %75 = fadd contract double %70, %74
  %76 = fmul contract double %75, 2.000000e-01
  %77 = getelementptr inbounds double, double addrspace(1)* %1, i64 %72
  store double %76, double addrspace(1)* %77, align 8, !tbaa !9
  br label %78

78:                                               ; preds = %42, %47
  %79 = add i32 %43, 1
  %80 = icmp sgt i32 %79, %26
  br i1 %80, label %33, label %42, !llvm.loop !13
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!10, !10, i64 0}
!10 = !{!"double", !11, i64 0}
!11 = !{!"omnipotent char", !12, i64 0}
!12 = !{!"Simple C++ TBAA"}
!13 = distinct !{!13, !8}

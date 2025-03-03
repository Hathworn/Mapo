; ModuleID = '../data/hip_kernels/11810/26/main.cu'
source_filename = "../data/hip_kernels/11810/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z13StarRadKernelPdS_S_diiS_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readnone %1, double addrspace(1)* nocapture readnone %2, double %3, i32 %4, i32 %5, double addrspace(1)* nocapture readonly %6, double addrspace(1)* nocapture readnone %7, double addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !5, !invariant.load !6
  %16 = zext i16 %15 to i32
  %17 = mul i32 %12, %16
  %18 = add i32 %17, %10
  %19 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = getelementptr i8, i8 addrspace(4)* %11, i64 6
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = load i16, i16 addrspace(4)* %22, align 2, !range !5, !invariant.load !6
  %24 = zext i16 %23 to i32
  %25 = mul i32 %20, %24
  %26 = add i32 %25, %19
  %27 = icmp slt i32 %26, %4
  %28 = icmp slt i32 %18, %5
  %29 = select i1 %27, i1 %28, i1 false
  br i1 %29, label %30, label %76

30:                                               ; preds = %9
  %31 = icmp eq i32 %26, 0
  %32 = add nsw i32 %4, -1
  %33 = icmp eq i32 %26, %32
  %34 = select i1 %31, i1 true, i1 %33
  br i1 %34, label %70, label %35

35:                                               ; preds = %30
  %36 = mul nsw i32 %26, %5
  %37 = add nsw i32 %36, %18
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %0, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !6
  %41 = add nsw i32 %26, -1
  %42 = mul nsw i32 %41, %5
  %43 = add nsw i32 %42, %18
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %0, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !7, !amdgpu.noclobber !6
  %47 = fsub contract double %40, %46
  %48 = sext i32 %26 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %6, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !6
  %51 = fmul contract double %47, %50
  %52 = add nsw i32 %26, 1
  %53 = mul nsw i32 %52, %5
  %54 = add nsw i32 %53, %18
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !6
  %58 = fsub contract double %57, %40
  %59 = sext i32 %52 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %6, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7, !amdgpu.noclobber !6
  %62 = fmul contract double %58, %61
  %63 = fmul contract double %51, %62
  %64 = fcmp contract ogt double %63, 0.000000e+00
  br i1 %64, label %65, label %70

65:                                               ; preds = %35
  %66 = fmul contract double %62, 2.000000e+00
  %67 = fmul contract double %51, %66
  %68 = fadd contract double %51, %62
  %69 = fdiv contract double %67, %68
  br label %70

70:                                               ; preds = %35, %30, %65
  %71 = phi double [ %69, %65 ], [ 0.000000e+00, %30 ], [ 0.000000e+00, %35 ]
  %72 = mul nsw i32 %18, %4
  %73 = add nsw i32 %26, %72
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double addrspace(1)* %8, i64 %74
  store double %71, double addrspace(1)* %75, align 8, !tbaa !7
  br label %76

76:                                               ; preds = %70, %9
  ret void
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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

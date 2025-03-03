; ModuleID = '../data/hip_kernels/11810/27/main.cu'
source_filename = "../data/hip_kernels/11810/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14StarRadKernel2PdS_S_diiS_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2, double %3, i32 %4, i32 %5, double addrspace(1)* nocapture readnone %6, double addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8) local_unnamed_addr #0 {
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
  br i1 %29, label %30, label %87

30:                                               ; preds = %9
  %31 = mul nsw i32 %26, %5
  %32 = add nsw i32 %31, %18
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double addrspace(1)* %1, i64 %33
  %35 = load double, double addrspace(1)* %34, align 8, !tbaa !7, !amdgpu.noclobber !6
  %36 = fcmp contract ogt double %35, 0.000000e+00
  %37 = icmp sgt i32 %26, 0
  %38 = select i1 %36, i1 %37, i1 false
  br i1 %38, label %39, label %63

39:                                               ; preds = %30
  %40 = add nsw i32 %26, -1
  %41 = mul nsw i32 %40, %5
  %42 = add nsw i32 %41, %18
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %0, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !6
  %46 = zext i32 %26 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %7, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !6
  %49 = zext i32 %40 to i64
  %50 = getelementptr inbounds double, double addrspace(1)* %7, i64 %49
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7, !amdgpu.noclobber !6
  %52 = fsub contract double %48, %51
  %53 = fmul contract double %35, %3
  %54 = fsub contract double %52, %53
  %55 = fmul contract double %54, 5.000000e-01
  %56 = mul nsw i32 %18, %4
  %57 = add nsw i32 %40, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds double, double addrspace(1)* %8, i64 %58
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !7, !amdgpu.noclobber !6
  %61 = fmul contract double %60, %55
  %62 = fadd contract double %45, %61
  br label %84

63:                                               ; preds = %30
  %64 = getelementptr inbounds double, double addrspace(1)* %0, i64 %33
  %65 = load double, double addrspace(1)* %64, align 8, !tbaa !7, !amdgpu.noclobber !6
  %66 = add nsw i32 %26, 1
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %7, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !6
  %70 = sext i32 %26 to i64
  %71 = getelementptr inbounds double, double addrspace(1)* %7, i64 %70
  %72 = load double, double addrspace(1)* %71, align 8, !tbaa !7, !amdgpu.noclobber !6
  %73 = fsub contract double %69, %72
  %74 = fmul contract double %35, %3
  %75 = fadd contract double %74, %73
  %76 = fmul contract double %75, 5.000000e-01
  %77 = mul nsw i32 %18, %4
  %78 = add nsw i32 %26, %77
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds double, double addrspace(1)* %8, i64 %79
  %81 = load double, double addrspace(1)* %80, align 8, !tbaa !7, !amdgpu.noclobber !6
  %82 = fmul contract double %81, %76
  %83 = fsub contract double %65, %82
  br label %84

84:                                               ; preds = %63, %39
  %85 = phi double [ %62, %39 ], [ %83, %63 ]
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %33
  store double %85, double addrspace(1)* %86, align 8, !tbaa !7
  br label %87

87:                                               ; preds = %84, %9
  %88 = icmp eq i32 %26, 0
  %89 = select i1 %88, i1 %28, i1 false
  br i1 %89, label %90, label %97

90:                                               ; preds = %87
  %91 = mul nsw i32 %5, %4
  %92 = add nsw i32 %18, %91
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, double addrspace(1)* %2, i64 %93
  store double 0.000000e+00, double addrspace(1)* %94, align 8, !tbaa !7
  %95 = sext i32 %18 to i64
  %96 = getelementptr inbounds double, double addrspace(1)* %2, i64 %95
  store double 0.000000e+00, double addrspace(1)* %96, align 8, !tbaa !7
  br label %97

97:                                               ; preds = %90, %87
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

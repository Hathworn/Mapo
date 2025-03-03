; ModuleID = '../data/hip_kernels/11810/37/main.cu'
source_filename = "../data/hip_kernels/11810/37/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z18VanLeerThetaKernelPdS_S_diiiPiS_S_S_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double %3, i32 %4, i32 %5, i32 %6, i32 addrspace(1)* nocapture readonly %7, double addrspace(1)* nocapture readonly %8, double addrspace(1)* nocapture readonly %9, double addrspace(1)* nocapture readonly %10, double addrspace(1)* nocapture %11) local_unnamed_addr #0 {
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = getelementptr i8, i8 addrspace(4)* %14, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %13
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = getelementptr i8, i8 addrspace(4)* %14, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = add i32 %28, %22
  %30 = icmp slt i32 %29, %4
  %31 = icmp slt i32 %21, %5
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %80

33:                                               ; preds = %12
  %34 = icmp eq i32 %6, 0
  %35 = sext i32 %29 to i64
  br i1 %34, label %40, label %36

36:                                               ; preds = %33
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %35
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = icmp eq i32 %38, 0
  br i1 %39, label %40, label %80

40:                                               ; preds = %33, %36
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %35
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !11, !amdgpu.noclobber !6
  %43 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %44 = load double, double addrspace(1)* %43, align 8, !tbaa !11, !amdgpu.noclobber !6
  %45 = fsub contract double %42, %44
  %46 = fmul contract double %45, %3
  %47 = getelementptr inbounds double, double addrspace(1)* %2, i64 %35
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !11, !amdgpu.noclobber !6
  %49 = fdiv contract double 1.000000e+00, %48
  %50 = mul nsw i32 %29, %5
  %51 = add nsw i32 %50, %21
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds double, double addrspace(1)* %8, i64 %52
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !11, !amdgpu.noclobber !6
  %55 = fmul contract double %46, %54
  %56 = getelementptr inbounds double, double addrspace(1)* %9, i64 %52
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !11, !amdgpu.noclobber !6
  %58 = fmul contract double %55, %57
  %59 = getelementptr inbounds double, double addrspace(1)* %10, i64 %52
  %60 = load double, double addrspace(1)* %59, align 8, !tbaa !11, !amdgpu.noclobber !6
  %61 = fmul contract double %58, %60
  %62 = add nsw i32 %21, 1
  %63 = srem i32 %62, %5
  %64 = add nsw i32 %63, %50
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %8, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !11, !amdgpu.noclobber !6
  %68 = fmul contract double %46, %67
  %69 = getelementptr inbounds double, double addrspace(1)* %9, i64 %65
  %70 = load double, double addrspace(1)* %69, align 8, !tbaa !11, !amdgpu.noclobber !6
  %71 = fmul contract double %68, %70
  %72 = getelementptr inbounds double, double addrspace(1)* %10, i64 %65
  %73 = load double, double addrspace(1)* %72, align 8, !tbaa !11, !amdgpu.noclobber !6
  %74 = fmul contract double %71, %73
  %75 = fsub contract double %61, %74
  %76 = fmul contract double %49, %75
  %77 = getelementptr inbounds double, double addrspace(1)* %11, i64 %52
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !11, !amdgpu.noclobber !6
  %79 = fadd contract double %78, %76
  store double %79, double addrspace(1)* %77, align 8, !tbaa !11
  br label %80

80:                                               ; preds = %36, %40, %12
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"double", !9, i64 0}

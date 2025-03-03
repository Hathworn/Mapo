; ModuleID = '../data/hip_kernels/11810/36/main.cu'
source_filename = "../data/hip_kernels/11810/36/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z19VanLeerRadialKernelPdS_S_S_S_S_iidiS_S_(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7, double %8, i32 %9, double addrspace(1)* nocapture %10, double addrspace(1)* nocapture readonly %11) local_unnamed_addr #0 {
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
  %30 = icmp slt i32 %29, %7
  %31 = icmp slt i32 %21, %6
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %82

33:                                               ; preds = %12
  %34 = sitofp i32 %6 to double
  %35 = fdiv contract double 0x401921FB54442D18, %34
  %36 = fmul contract double %35, %8
  %37 = sext i32 %29 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %0, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !6
  %40 = fmul contract double %36, %39
  %41 = mul nsw i32 %29, %6
  %42 = add nsw i32 %41, %21
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %2, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !6
  %46 = fmul contract double %40, %45
  %47 = getelementptr inbounds double, double addrspace(1)* %3, i64 %43
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !6
  %49 = fmul contract double %46, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %4, i64 %43
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7, !amdgpu.noclobber !6
  %52 = fmul contract double %49, %51
  %53 = getelementptr inbounds double, double addrspace(1)* %1, i64 %37
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !6
  %55 = fmul contract double %36, %54
  %56 = add nsw i32 %29, 1
  %57 = mul nsw i32 %56, %6
  %58 = add nsw i32 %57, %21
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double addrspace(1)* %2, i64 %59
  %61 = load double, double addrspace(1)* %60, align 8, !tbaa !7, !amdgpu.noclobber !6
  %62 = fmul contract double %55, %61
  %63 = getelementptr inbounds double, double addrspace(1)* %3, i64 %59
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !6
  %65 = fmul contract double %62, %64
  %66 = getelementptr inbounds double, double addrspace(1)* %4, i64 %59
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7, !amdgpu.noclobber !6
  %68 = fmul contract double %65, %67
  %69 = fsub contract double %52, %68
  %70 = getelementptr inbounds double, double addrspace(1)* %11, i64 %37
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7, !amdgpu.noclobber !6
  %72 = fmul contract double %71, %69
  %73 = getelementptr inbounds double, double addrspace(1)* %10, i64 %43
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !6
  %75 = fadd contract double %74, %72
  store double %75, double addrspace(1)* %73, align 8, !tbaa !7
  %76 = icmp eq i32 %29, 0
  %77 = icmp ne i32 %9, 0
  %78 = select i1 %76, i1 %77, i1 false
  br i1 %78, label %79, label %82

79:                                               ; preds = %33
  %80 = sext i32 %21 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %5, i64 %80
  store double %69, double addrspace(1)* %81, align 8, !tbaa !7
  br label %82

82:                                               ; preds = %33, %79, %12
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

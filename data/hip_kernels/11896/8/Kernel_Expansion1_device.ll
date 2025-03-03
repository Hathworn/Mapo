; ModuleID = '../data/hip_kernels/11896/8/main.cu'
source_filename = "../data/hip_kernels/11896/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z17Kernel_Expansion1PdS_iidddd(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3, double %4, double %5, double %6, double %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %2
  %27 = icmp slt i32 %25, %3
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %85

29:                                               ; preds = %8
  %30 = sitofp i32 %17 to double
  %31 = fsub contract double %30, %5
  %32 = fdiv contract double %31, %4
  %33 = fadd contract double %32, %5
  %34 = sitofp i32 %25 to double
  %35 = fsub contract double %34, %7
  %36 = fdiv contract double %35, %6
  %37 = fadd contract double %36, %7
  %38 = fptosi double %33 to i32
  %39 = srem i32 %38, %2
  %40 = fptosi double %37 to i32
  %41 = srem i32 %40, %3
  %42 = add nsw i32 %39, 1
  %43 = srem i32 %42, %2
  %44 = add nsw i32 %41, 1
  %45 = srem i32 %44, %3
  %46 = mul nsw i32 %41, %2
  %47 = add nsw i32 %46, %39
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds double, double addrspace(1)* %0, i64 %48
  %50 = load double, double addrspace(1)* %49, align 8, !tbaa !7, !amdgpu.noclobber !5
  %51 = mul nsw i32 %45, %2
  %52 = add nsw i32 %51, %39
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds double, double addrspace(1)* %0, i64 %53
  %55 = load double, double addrspace(1)* %54, align 8, !tbaa !7, !amdgpu.noclobber !5
  %56 = add nsw i32 %51, %43
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %0, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !5
  %60 = add nsw i32 %46, %43
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds double, double addrspace(1)* %0, i64 %61
  %63 = load double, double addrspace(1)* %62, align 8, !tbaa !7, !amdgpu.noclobber !5
  %64 = fptrunc double %33 to float
  %65 = tail call float @llvm.floor.f32(float %64)
  %66 = fpext float %65 to double
  %67 = fsub contract double %33, %66
  %68 = fptrunc double %37 to float
  %69 = tail call float @llvm.floor.f32(float %68)
  %70 = fpext float %69 to double
  %71 = fsub contract double %37, %70
  %72 = fsub contract double %55, %50
  %73 = fmul contract double %71, %72
  %74 = fadd contract double %50, %73
  %75 = fsub contract double %59, %63
  %76 = fmul contract double %71, %75
  %77 = fadd contract double %63, %76
  %78 = fsub contract double %77, %74
  %79 = fmul contract double %67, %78
  %80 = fadd contract double %74, %79
  %81 = mul nsw i32 %25, %2
  %82 = add nsw i32 %81, %17
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double addrspace(1)* %1, i64 %83
  store double %80, double addrspace(1)* %84, align 8, !tbaa !7
  br label %85

85:                                               ; preds = %8, %29
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.floor.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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

; ModuleID = '../data/hip_kernels/7764/9/main.cu'
source_filename = "../data/hip_kernels/7764/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z14square1_kerneliPdS_S_(i32 %0, double addrspace(1)* nocapture writeonly %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture readonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = ashr i32 %0, 1
  %15 = shl i32 %13, 1
  %16 = icmp eq i32 %13, 0
  br i1 %16, label %68, label %17

17:                                               ; preds = %4
  %18 = ashr i32 %0, 2
  %19 = sub nsw i32 %0, %15
  %20 = sub nsw i32 %18, %13
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds double, double addrspace(1)* %3, i64 %21
  %23 = load double, double addrspace(1)* %22, align 8, !tbaa !7, !amdgpu.noclobber !5
  %24 = fsub contract double 5.000000e-01, %23
  %25 = sext i32 %13 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %3, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = sext i32 %15 to i64
  %29 = getelementptr inbounds double, double addrspace(1)* %2, i64 %28
  %30 = add nuw nsw i32 %15, 1
  %31 = sext i32 %30 to i64
  %32 = bitcast double addrspace(1)* %29 to <2 x double> addrspace(1)*
  %33 = load <2 x double>, <2 x double> addrspace(1)* %32, align 8, !tbaa !7
  %34 = sext i32 %19 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %2, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = add nsw i32 %19, 1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds double, double addrspace(1)* %2, i64 %38
  %40 = load double, double addrspace(1)* %39, align 8, !tbaa !7, !amdgpu.noclobber !5
  %41 = extractelement <2 x double> %33, i64 0
  %42 = fmul contract double %41, 2.000000e+00
  %43 = extractelement <2 x double> %33, i64 1
  %44 = fmul contract double %42, %43
  %45 = fsub contract double %41, %43
  %46 = fadd contract double %41, %43
  %47 = fmul contract double %45, %46
  %48 = fmul contract double %36, 2.000000e+00
  %49 = fmul contract double %48, %40
  %50 = fsub contract double %36, %40
  %51 = fadd contract double %36, %40
  %52 = fmul contract double %50, %51
  %53 = fsub contract double %47, %52
  %54 = fadd contract double %44, %49
  %55 = fmul contract double %24, %53
  %56 = fmul contract double %27, %54
  %57 = fadd contract double %56, %55
  %58 = fmul contract double %24, %54
  %59 = fmul contract double %27, %53
  %60 = fsub contract double %58, %59
  %61 = fsub contract double %47, %57
  %62 = getelementptr inbounds double, double addrspace(1)* %1, i64 %28
  store double %61, double addrspace(1)* %62, align 8, !tbaa !7
  %63 = fsub contract double %60, %44
  %64 = getelementptr inbounds double, double addrspace(1)* %1, i64 %31
  store double %63, double addrspace(1)* %64, align 8, !tbaa !7
  %65 = fadd contract double %52, %57
  %66 = getelementptr inbounds double, double addrspace(1)* %1, i64 %34
  store double %65, double addrspace(1)* %66, align 8, !tbaa !7
  %67 = fsub contract double %60, %49
  br label %95

68:                                               ; preds = %4
  %69 = load double, double addrspace(1)* %2, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = getelementptr inbounds double, double addrspace(1)* %2, i64 1
  %71 = load double, double addrspace(1)* %70, align 8, !tbaa !7, !amdgpu.noclobber !5
  %72 = fmul contract double %69, %69
  %73 = fmul contract double %71, %71
  %74 = fadd contract double %72, %73
  store double %74, double addrspace(1)* %1, align 8, !tbaa !7
  %75 = fneg contract double %69
  %76 = fmul contract double %71, %75
  %77 = fmul contract double %69, %71
  %78 = fsub contract double %76, %77
  %79 = getelementptr inbounds double, double addrspace(1)* %1, i64 1
  store double %78, double addrspace(1)* %79, align 8, !tbaa !7
  %80 = sext i32 %14 to i64
  %81 = getelementptr inbounds double, double addrspace(1)* %2, i64 %80
  %82 = load double, double addrspace(1)* %81, align 8, !tbaa !7
  %83 = add nsw i32 %14, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double addrspace(1)* %2, i64 %84
  %86 = load double, double addrspace(1)* %85, align 8, !tbaa !7
  %87 = fneg contract double %82
  %88 = fmul contract double %86, %87
  %89 = fmul contract double %82, %86
  %90 = fsub contract double %88, %89
  %91 = getelementptr inbounds double, double addrspace(1)* %1, i64 %84
  store double %90, double addrspace(1)* %91, align 8, !tbaa !7
  %92 = fmul contract double %82, %82
  %93 = fmul contract double %86, %86
  %94 = fsub contract double %92, %93
  br label %95

95:                                               ; preds = %68, %17
  %96 = phi i64 [ %80, %68 ], [ %38, %17 ]
  %97 = phi double [ %94, %68 ], [ %67, %17 ]
  %98 = getelementptr inbounds double, double addrspace(1)* %1, i64 %96
  store double %97, double addrspace(1)* %98, align 8, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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

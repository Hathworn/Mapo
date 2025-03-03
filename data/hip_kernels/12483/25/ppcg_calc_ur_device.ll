; ModuleID = '../data/hip_kernels/12483/25/main.cu'
source_filename = "../data/hip_kernels/12483/25/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12ppcg_calc_uriiiPKdS0_S0_PdS1_(i32 %0, i32 %1, i32 %2, double addrspace(1)* nocapture readonly %3, double addrspace(1)* nocapture readonly %4, double addrspace(1)* nocapture readonly %5, double addrspace(1)* nocapture %6, double addrspace(1)* nocapture %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !5, !invariant.load !6
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = add i32 %16, %9
  %18 = mul nsw i32 %1, %0
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %80

20:                                               ; preds = %8
  %21 = shl nsw i32 %2, 1
  %22 = add nsw i32 %21, %0
  %23 = freeze i32 %17
  %24 = freeze i32 %0
  %25 = sdiv i32 %23, %24
  %26 = mul i32 %25, %24
  %27 = sub i32 %23, %26
  %28 = add nsw i32 %22, 1
  %29 = mul nsw i32 %28, %2
  %30 = add nsw i32 %27, %29
  %31 = mul nsw i32 %25, %22
  %32 = add nsw i32 %30, %31
  %33 = add nsw i32 %32, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %3, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !6
  %37 = sext i32 %32 to i64
  %38 = getelementptr inbounds double, double addrspace(1)* %3, i64 %37
  %39 = load double, double addrspace(1)* %38, align 8, !tbaa !7, !amdgpu.noclobber !6
  %40 = fadd contract double %36, %39
  %41 = fadd contract double %40, 1.000000e+00
  %42 = add nsw i32 %32, %22
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds double, double addrspace(1)* %4, i64 %43
  %45 = load double, double addrspace(1)* %44, align 8, !tbaa !7, !amdgpu.noclobber !6
  %46 = getelementptr inbounds double, double addrspace(1)* %4, i64 %37
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !6
  %48 = fadd contract double %45, %47
  %49 = fadd contract double %41, %48
  %50 = getelementptr inbounds double, double addrspace(1)* %5, i64 %37
  %51 = load double, double addrspace(1)* %50, align 8, !tbaa !7, !amdgpu.noclobber !6
  %52 = fmul contract double %51, %49
  %53 = getelementptr inbounds double, double addrspace(1)* %5, i64 %34
  %54 = load double, double addrspace(1)* %53, align 8, !tbaa !7, !amdgpu.noclobber !6
  %55 = fmul contract double %36, %54
  %56 = add nsw i32 %32, -1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds double, double addrspace(1)* %5, i64 %57
  %59 = load double, double addrspace(1)* %58, align 8, !tbaa !7, !amdgpu.noclobber !6
  %60 = fmul contract double %39, %59
  %61 = fadd contract double %55, %60
  %62 = fsub contract double %52, %61
  %63 = getelementptr inbounds double, double addrspace(1)* %5, i64 %43
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !6
  %65 = fmul contract double %45, %64
  %66 = sub nsw i32 %32, %22
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %5, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !6
  %70 = fmul contract double %47, %69
  %71 = fadd contract double %65, %70
  %72 = fsub contract double %62, %71
  %73 = getelementptr inbounds double, double addrspace(1)* %7, i64 %37
  %74 = load double, double addrspace(1)* %73, align 8, !tbaa !7, !amdgpu.noclobber !6
  %75 = fsub contract double %74, %72
  store double %75, double addrspace(1)* %73, align 8, !tbaa !7
  %76 = load double, double addrspace(1)* %50, align 8, !tbaa !7
  %77 = getelementptr inbounds double, double addrspace(1)* %6, i64 %37
  %78 = load double, double addrspace(1)* %77, align 8, !tbaa !7
  %79 = fadd contract double %76, %78
  store double %79, double addrspace(1)* %77, align 8, !tbaa !7
  br label %80

80:                                               ; preds = %8, %20
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}

; ModuleID = '../data/hip_kernels/3647/2/main.cu'
source_filename = "../data/hip_kernels/3647/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16sim_kernel_naivePdS_mmddd(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture %1, i64 %2, i64 %3, double %4, double %5, double %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add i32 %14, %15
  %17 = add i32 %16, 1
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = sext i32 %17 to i64
  %27 = add i64 %2, -1
  %28 = icmp ugt i64 %27, %26
  br i1 %28, label %29, label %75

29:                                               ; preds = %7
  %30 = add i32 %25, 1
  %31 = sext i32 %30 to i64
  %32 = add i64 %3, -1
  %33 = icmp ugt i64 %32, %31
  br i1 %33, label %34, label %75

34:                                               ; preds = %29
  %35 = mul i64 %31, %2
  %36 = add i64 %35, %26
  %37 = getelementptr inbounds double, double addrspace(1)* %0, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !5
  %39 = sext i32 %16 to i64
  %40 = add i64 %35, %39
  %41 = getelementptr inbounds double, double addrspace(1)* %0, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !5
  %43 = add i32 %16, 2
  %44 = sext i32 %43 to i64
  %45 = add i64 %35, %44
  %46 = getelementptr inbounds double, double addrspace(1)* %0, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !5
  %48 = fadd contract double %42, %47
  %49 = fmul contract double %38, 2.000000e+00
  %50 = fsub contract double %48, %49
  %51 = fmul contract double %50, %4
  %52 = sext i32 %25 to i64
  %53 = mul i64 %52, %2
  %54 = add i64 %53, %26
  %55 = getelementptr inbounds double, double addrspace(1)* %0, i64 %54
  %56 = load double, double addrspace(1)* %55, align 8, !tbaa !7, !amdgpu.noclobber !5
  %57 = add i32 %25, 2
  %58 = sext i32 %57 to i64
  %59 = mul i64 %58, %2
  %60 = add i64 %59, %26
  %61 = getelementptr inbounds double, double addrspace(1)* %0, i64 %60
  %62 = load double, double addrspace(1)* %61, align 8, !tbaa !7, !amdgpu.noclobber !5
  %63 = fadd contract double %56, %62
  %64 = fsub contract double %63, %49
  %65 = fmul contract double %64, %5
  %66 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !7, !amdgpu.noclobber !5
  %68 = fadd contract double %51, %65
  %69 = fmul contract double %68, %6
  %70 = fmul contract double %69, 5.000000e-01
  %71 = fadd contract double %67, %70
  store double %71, double addrspace(1)* %66, align 8, !tbaa !7
  %72 = fmul contract double %71, %6
  %73 = load double, double addrspace(1)* %37, align 8, !tbaa !7
  %74 = fadd contract double %73, %72
  store double %74, double addrspace(1)* %37, align 8, !tbaa !7
  br label %75

75:                                               ; preds = %7, %29, %34
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}

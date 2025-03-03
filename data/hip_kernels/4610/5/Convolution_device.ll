; ModuleID = '../data/hip_kernels/4610/5/main.cu'
source_filename = "../data/hip_kernels/4610/5/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11ConvolutionPdS_ii(double addrspace(1)* nocapture readonly %0, double addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp sgt i32 %13, %3
  br i1 %14, label %15, label %79

15:                                               ; preds = %4
  %16 = mul nsw i32 %3, %2
  %17 = sub nsw i32 %16, %3
  %18 = icmp slt i32 %13, %17
  br i1 %18, label %19, label %79

19:                                               ; preds = %15
  %20 = srem i32 %13, %3
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %79, label %22

22:                                               ; preds = %19
  %23 = add nsw i32 %13, 1
  %24 = srem i32 %23, %3
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %79, label %26

26:                                               ; preds = %22
  %27 = sub nsw i32 %13, %3
  %28 = add nsw i32 %27, -1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds double, double addrspace(1)* %0, i64 %29
  %31 = load double, double addrspace(1)* %30, align 8, !tbaa !7, !amdgpu.noclobber !5
  %32 = fmul contract double %31, 2.000000e-01
  %33 = add nsw i32 %13, -1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds double, double addrspace(1)* %0, i64 %34
  %36 = load double, double addrspace(1)* %35, align 8, !tbaa !7, !amdgpu.noclobber !5
  %37 = fmul contract double %36, 3.000000e-01
  %38 = fsub contract double %32, %37
  %39 = add nsw i32 %13, %3
  %40 = add nsw i32 %39, -1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds double, double addrspace(1)* %0, i64 %41
  %43 = load double, double addrspace(1)* %42, align 8, !tbaa !7, !amdgpu.noclobber !5
  %44 = fmul contract double %43, 4.000000e-01
  %45 = fadd contract double %38, %44
  %46 = sext i32 %27 to i64
  %47 = getelementptr inbounds double, double addrspace(1)* %0, i64 %46
  %48 = load double, double addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !5
  %49 = fmul contract double %48, 5.000000e-01
  %50 = fadd contract double %45, %49
  %51 = sext i32 %13 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %0, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !5
  %54 = fmul contract double %53, 6.000000e-01
  %55 = fadd contract double %50, %54
  %56 = sext i32 %39 to i64
  %57 = getelementptr inbounds double, double addrspace(1)* %0, i64 %56
  %58 = load double, double addrspace(1)* %57, align 8, !tbaa !7, !amdgpu.noclobber !5
  %59 = fmul contract double %58, 0x3FE6666666666666
  %60 = fadd contract double %55, %59
  %61 = add nsw i32 %27, 1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double addrspace(1)* %0, i64 %62
  %64 = load double, double addrspace(1)* %63, align 8, !tbaa !7, !amdgpu.noclobber !5
  %65 = fmul contract double %64, 8.000000e-01
  %66 = fsub contract double %60, %65
  %67 = sext i32 %23 to i64
  %68 = getelementptr inbounds double, double addrspace(1)* %0, i64 %67
  %69 = load double, double addrspace(1)* %68, align 8, !tbaa !7, !amdgpu.noclobber !5
  %70 = fmul contract double %69, 9.000000e-01
  %71 = fsub contract double %66, %70
  %72 = add nsw i32 %39, 1
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double addrspace(1)* %0, i64 %73
  %75 = load double, double addrspace(1)* %74, align 8, !tbaa !7, !amdgpu.noclobber !5
  %76 = fmul contract double %75, 1.000000e-01
  %77 = fadd contract double %71, %76
  %78 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  store double %77, double addrspace(1)* %78, align 8, !tbaa !7
  br label %79

79:                                               ; preds = %26, %22, %19, %15, %4
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

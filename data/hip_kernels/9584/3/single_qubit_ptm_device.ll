; ModuleID = '../data/hip_kernels/9584/3/main.cu'
source_filename = "../data/hip_kernels/9584/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@ptm = external hidden local_unnamed_addr addrspace(3) global [0 x double], align 8

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z16single_qubit_ptmPdS_jj(double addrspace(1)* nocapture %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = shl i32 %3, 1
  %15 = lshr i32 %13, %14
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %92

17:                                               ; preds = %4
  %18 = shl i32 %2, 1
  %19 = add i32 %18, 2
  %20 = shl nsw i32 -1, %19
  %21 = xor i32 %20, -1
  %22 = or i32 %12, %5
  %23 = and i32 %22, %20
  %24 = and i32 %22, 3
  %25 = shl i32 %24, %18
  %26 = or i32 %25, %23
  %27 = and i32 %22, %21
  %28 = ashr i32 %27, 2
  %29 = or i32 %26, %28
  %30 = icmp ult i32 %5, 16
  br i1 %30, label %31, label %36

31:                                               ; preds = %17
  %32 = zext i32 %5 to i64
  %33 = getelementptr inbounds double, double addrspace(1)* %1, i64 %32
  %34 = load double, double addrspace(1)* %33, align 8, !tbaa !7, !amdgpu.noclobber !6
  %35 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %5
  store double %34, double addrspace(3)* %35, align 8, !tbaa !7
  br label %36

36:                                               ; preds = %31, %17
  %37 = icmp ult i32 %3, 2
  br i1 %37, label %38, label %54

38:                                               ; preds = %36
  %39 = add nuw nsw i32 %5, 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7, !amdgpu.noclobber !6
  %43 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %39
  store double %42, double addrspace(3)* %43, align 8, !tbaa !7
  %44 = add nuw nsw i32 %5, 8
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds double, double addrspace(1)* %1, i64 %45
  %47 = load double, double addrspace(1)* %46, align 8, !tbaa !7, !amdgpu.noclobber !6
  %48 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %44
  store double %47, double addrspace(3)* %48, align 8, !tbaa !7
  %49 = add nuw nsw i32 %5, 12
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds double, double addrspace(1)* %1, i64 %50
  %52 = load double, double addrspace(1)* %51, align 8, !tbaa !7, !amdgpu.noclobber !6
  %53 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %49
  store double %52, double addrspace(3)* %53, align 8, !tbaa !7
  br label %54

54:                                               ; preds = %38, %36
  %55 = sext i32 %29 to i64
  %56 = getelementptr inbounds double, double addrspace(1)* %0, i64 %55
  %57 = load double, double addrspace(1)* %56, align 8, !tbaa !7, !amdgpu.noclobber !6
  %58 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 16), i32 %5
  store double %57, double addrspace(3)* %58, align 8, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %59 = and i32 %5, 1020
  %60 = shl nuw nsw i32 %5, 2
  %61 = and i32 %60, 12
  %62 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %61
  %63 = load double, double addrspace(3)* %62, align 8, !tbaa !7
  %64 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 16), i32 %59
  %65 = load double, double addrspace(3)* %64, align 8, !tbaa !7
  %66 = fmul contract double %63, %65
  %67 = fadd contract double %66, 0.000000e+00
  %68 = or i32 %61, 1
  %69 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %68
  %70 = load double, double addrspace(3)* %69, align 8, !tbaa !7
  %71 = or i32 %59, 1
  %72 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 16), i32 %71
  %73 = load double, double addrspace(3)* %72, align 8, !tbaa !7
  %74 = fmul contract double %70, %73
  %75 = fadd contract double %67, %74
  %76 = or i32 %61, 2
  %77 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %76
  %78 = load double, double addrspace(3)* %77, align 8, !tbaa !7
  %79 = or i32 %59, 2
  %80 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 16), i32 %79
  %81 = load double, double addrspace(3)* %80, align 8, !tbaa !7
  %82 = fmul contract double %78, %81
  %83 = fadd contract double %75, %82
  %84 = or i32 %61, 3
  %85 = getelementptr inbounds [0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 %84
  %86 = load double, double addrspace(3)* %85, align 8, !tbaa !7
  %87 = or i32 %5, 3
  %88 = getelementptr inbounds double, double addrspace(3)* getelementptr inbounds ([0 x double], [0 x double] addrspace(3)* @ptm, i32 0, i32 16), i32 %87
  %89 = load double, double addrspace(3)* %88, align 8, !tbaa !7
  %90 = fmul contract double %86, %89
  %91 = fadd contract double %83, %90
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store double %91, double addrspace(1)* %56, align 8, !tbaa !7
  br label %92

92:                                               ; preds = %4, %54
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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

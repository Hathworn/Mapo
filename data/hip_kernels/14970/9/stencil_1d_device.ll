; ModuleID = '../data/hip_kernels/14970/9/main.cu'
source_filename = "../data/hip_kernels/14970/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10stencil_1diPdS_E4temp = internal unnamed_addr addrspace(3) global [74 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10stencil_1diPdS_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %0
  br i1 %13, label %14, label %90

14:                                               ; preds = %3
  %15 = add nuw nsw i32 %11, 5
  %16 = sext i32 %12 to i64
  %17 = getelementptr inbounds double, double addrspace(1)* %1, i64 %16
  %18 = load double, double addrspace(1)* %17, align 8, !tbaa !7, !amdgpu.noclobber !5
  %19 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %15
  store double %18, double addrspace(3)* %19, align 8, !tbaa !7
  %20 = icmp ult i32 %11, 5
  %21 = icmp sgt i32 %12, 4
  %22 = select i1 %20, i1 %21, i1 false
  br i1 %22, label %23, label %29

23:                                               ; preds = %14
  %24 = add nsw i32 %12, -5
  %25 = zext i32 %24 to i64
  %26 = getelementptr inbounds double, double addrspace(1)* %1, i64 %25
  %27 = load double, double addrspace(1)* %26, align 8, !tbaa !7, !amdgpu.noclobber !5
  %28 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %11
  store double %27, double addrspace(3)* %28, align 8, !tbaa !7
  br label %29

29:                                               ; preds = %23, %14
  %30 = add nsw i32 %0, -5
  %31 = icmp slt i32 %12, %30
  %32 = select i1 %20, i1 %31, i1 false
  br i1 %32, label %33, label %40

33:                                               ; preds = %29
  %34 = add nsw i32 %12, 64
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds double, double addrspace(1)* %1, i64 %35
  %37 = load double, double addrspace(1)* %36, align 8, !tbaa !7, !amdgpu.noclobber !5
  %38 = add nuw nsw i32 %11, 69
  %39 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %38
  store double %37, double addrspace(3)* %39, align 8, !tbaa !7
  br label %40

40:                                               ; preds = %33, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %41 = select i1 %21, i1 %31, i1 false
  br i1 %41, label %42, label %84

42:                                               ; preds = %40
  %43 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %11
  %44 = load double, double addrspace(3)* %43, align 8, !tbaa !7
  %45 = fadd contract double %44, 0.000000e+00
  %46 = add nuw nsw i32 %11, 1
  %47 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %46
  %48 = load double, double addrspace(3)* %47, align 8, !tbaa !7
  %49 = fadd contract double %45, %48
  %50 = add nuw nsw i32 %11, 2
  %51 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %50
  %52 = load double, double addrspace(3)* %51, align 8, !tbaa !7
  %53 = fadd contract double %49, %52
  %54 = add nuw nsw i32 %11, 3
  %55 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %54
  %56 = load double, double addrspace(3)* %55, align 8, !tbaa !7
  %57 = fadd contract double %53, %56
  %58 = add nuw nsw i32 %11, 4
  %59 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %58
  %60 = load double, double addrspace(3)* %59, align 8, !tbaa !7
  %61 = fadd contract double %57, %60
  %62 = load double, double addrspace(3)* %19, align 8, !tbaa !7
  %63 = fadd contract double %61, %62
  %64 = add nuw nsw i32 %11, 6
  %65 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %64
  %66 = load double, double addrspace(3)* %65, align 8, !tbaa !7
  %67 = fadd contract double %63, %66
  %68 = add nuw nsw i32 %11, 7
  %69 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %68
  %70 = load double, double addrspace(3)* %69, align 8, !tbaa !7
  %71 = fadd contract double %67, %70
  %72 = add nuw nsw i32 %11, 8
  %73 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %72
  %74 = load double, double addrspace(3)* %73, align 8, !tbaa !7
  %75 = fadd contract double %71, %74
  %76 = add nuw nsw i32 %11, 9
  %77 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %76
  %78 = load double, double addrspace(3)* %77, align 8, !tbaa !7
  %79 = fadd contract double %75, %78
  %80 = add nuw nsw i32 %11, 10
  %81 = getelementptr inbounds [74 x double], [74 x double] addrspace(3)* @_ZZ10stencil_1diPdS_E4temp, i32 0, i32 %80
  %82 = load double, double addrspace(3)* %81, align 8, !tbaa !7
  %83 = fadd contract double %79, %82
  br label %87

84:                                               ; preds = %40
  %85 = sitofp i32 %12 to double
  %86 = fmul contract double %85, 1.100000e+01
  br label %87

87:                                               ; preds = %84, %42
  %88 = phi double [ %83, %42 ], [ %86, %84 ]
  %89 = getelementptr inbounds double, double addrspace(1)* %2, i64 %16
  store double %88, double addrspace(1)* %89, align 8, !tbaa !7
  br label %90

90:                                               ; preds = %87, %3
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

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
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

; ModuleID = '../data/hip_kernels/14038/0/main.cu'
source_filename = "../data/hip_kernels/14038/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9innerProdPfS_S_E4temp = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9innerProdPfS_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %11, %4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds float, float addrspace(1)* %1, i64 %13
  %17 = load float, float addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = fmul contract float %15, %17
  %19 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 %4
  store float %18, float addrspace(3)* %19, align 4, !tbaa !7
  store float 8.000000e+00, float addrspace(1)* %2, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp eq i32 %4, 0
  br i1 %20, label %21, label %87

21:                                               ; preds = %3
  %22 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 0), align 16, !tbaa !7
  %23 = fadd contract float %22, 0.000000e+00
  %24 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 1), align 4, !tbaa !7
  %25 = fadd contract float %23, %24
  %26 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 2), align 8, !tbaa !7
  %27 = fadd contract float %25, %26
  %28 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 3), align 4, !tbaa !7
  %29 = fadd contract float %27, %28
  %30 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 4), align 16, !tbaa !7
  %31 = fadd contract float %29, %30
  %32 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 5), align 4, !tbaa !7
  %33 = fadd contract float %31, %32
  %34 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 6), align 8, !tbaa !7
  %35 = fadd contract float %33, %34
  %36 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 7), align 4, !tbaa !7
  %37 = fadd contract float %35, %36
  %38 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 8), align 16, !tbaa !7
  %39 = fadd contract float %37, %38
  %40 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 9), align 4, !tbaa !7
  %41 = fadd contract float %39, %40
  %42 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 10), align 8, !tbaa !7
  %43 = fadd contract float %41, %42
  %44 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 11), align 4, !tbaa !7
  %45 = fadd contract float %43, %44
  %46 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 12), align 16, !tbaa !7
  %47 = fadd contract float %45, %46
  %48 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 13), align 4, !tbaa !7
  %49 = fadd contract float %47, %48
  %50 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 14), align 8, !tbaa !7
  %51 = fadd contract float %49, %50
  %52 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 15), align 4, !tbaa !7
  %53 = fadd contract float %51, %52
  %54 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 16), align 16, !tbaa !7
  %55 = fadd contract float %53, %54
  %56 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 17), align 4, !tbaa !7
  %57 = fadd contract float %55, %56
  %58 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 18), align 8, !tbaa !7
  %59 = fadd contract float %57, %58
  %60 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 19), align 4, !tbaa !7
  %61 = fadd contract float %59, %60
  %62 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 20), align 16, !tbaa !7
  %63 = fadd contract float %61, %62
  %64 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 21), align 4, !tbaa !7
  %65 = fadd contract float %63, %64
  %66 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 22), align 8, !tbaa !7
  %67 = fadd contract float %65, %66
  %68 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 23), align 4, !tbaa !7
  %69 = fadd contract float %67, %68
  %70 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 24), align 16, !tbaa !7
  %71 = fadd contract float %69, %70
  %72 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 25), align 4, !tbaa !7
  %73 = fadd contract float %71, %72
  %74 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 26), align 8, !tbaa !7
  %75 = fadd contract float %73, %74
  %76 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 27), align 4, !tbaa !7
  %77 = fadd contract float %75, %76
  %78 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 28), align 16, !tbaa !7
  %79 = fadd contract float %77, %78
  %80 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 29), align 4, !tbaa !7
  %81 = fadd contract float %79, %80
  %82 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 30), align 8, !tbaa !7
  %83 = fadd contract float %81, %82
  %84 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ9innerProdPfS_S_E4temp, i32 0, i32 31), align 4, !tbaa !7
  %85 = fadd contract float %83, %84
  %86 = atomicrmw fadd float addrspace(1)* %2, float %85 syncscope("agent-one-as") monotonic, align 4
  br label %87

87:                                               ; preds = %21, %3
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}

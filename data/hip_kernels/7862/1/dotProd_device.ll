; ModuleID = '../data/hip_kernels/7862/1/main.cu'
source_filename = "../data/hip_kernels/7862/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ7dotProdPiS_S_E4temp = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z7dotProdPiS_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture writeonly %2) local_unnamed_addr #0 {
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
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  %17 = load i32, i32 addrspace(1)* %16, align 4, !tbaa !7, !amdgpu.noclobber !6
  %18 = mul nsw i32 %17, %15
  %19 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 %4
  store i32 %18, i32 addrspace(3)* %19, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = icmp eq i32 %4, 0
  br i1 %20, label %21, label %87

21:                                               ; preds = %3
  %22 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 0), align 16, !tbaa !7
  %23 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 1), align 4, !tbaa !7
  %24 = add nsw i32 %23, %22
  %25 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 2), align 8, !tbaa !7
  %26 = add nsw i32 %25, %24
  %27 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 3), align 4, !tbaa !7
  %28 = add nsw i32 %27, %26
  %29 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 4), align 16, !tbaa !7
  %30 = add nsw i32 %29, %28
  %31 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 5), align 4, !tbaa !7
  %32 = add nsw i32 %31, %30
  %33 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 6), align 8, !tbaa !7
  %34 = add nsw i32 %33, %32
  %35 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 7), align 4, !tbaa !7
  %36 = add nsw i32 %35, %34
  %37 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 8), align 16, !tbaa !7
  %38 = add nsw i32 %37, %36
  %39 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 9), align 4, !tbaa !7
  %40 = add nsw i32 %39, %38
  %41 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 10), align 8, !tbaa !7
  %42 = add nsw i32 %41, %40
  %43 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 11), align 4, !tbaa !7
  %44 = add nsw i32 %43, %42
  %45 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 12), align 16, !tbaa !7
  %46 = add nsw i32 %45, %44
  %47 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 13), align 4, !tbaa !7
  %48 = add nsw i32 %47, %46
  %49 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 14), align 8, !tbaa !7
  %50 = add nsw i32 %49, %48
  %51 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 15), align 4, !tbaa !7
  %52 = add nsw i32 %51, %50
  %53 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 16), align 16, !tbaa !7
  %54 = add nsw i32 %53, %52
  %55 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 17), align 4, !tbaa !7
  %56 = add nsw i32 %55, %54
  %57 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 18), align 8, !tbaa !7
  %58 = add nsw i32 %57, %56
  %59 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 19), align 4, !tbaa !7
  %60 = add nsw i32 %59, %58
  %61 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 20), align 16, !tbaa !7
  %62 = add nsw i32 %61, %60
  %63 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 21), align 4, !tbaa !7
  %64 = add nsw i32 %63, %62
  %65 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 22), align 8, !tbaa !7
  %66 = add nsw i32 %65, %64
  %67 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 23), align 4, !tbaa !7
  %68 = add nsw i32 %67, %66
  %69 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 24), align 16, !tbaa !7
  %70 = add nsw i32 %69, %68
  %71 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 25), align 4, !tbaa !7
  %72 = add nsw i32 %71, %70
  %73 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 26), align 8, !tbaa !7
  %74 = add nsw i32 %73, %72
  %75 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 27), align 4, !tbaa !7
  %76 = add nsw i32 %75, %74
  %77 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 28), align 16, !tbaa !7
  %78 = add nsw i32 %77, %76
  %79 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 29), align 4, !tbaa !7
  %80 = add nsw i32 %79, %78
  %81 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 30), align 8, !tbaa !7
  %82 = add nsw i32 %81, %80
  %83 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ7dotProdPiS_S_E4temp, i32 0, i32 31), align 4, !tbaa !7
  %84 = add nsw i32 %83, %82
  %85 = zext i32 %5 to i64
  %86 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %85
  store i32 %84, i32 addrspace(1)* %86, align 4, !tbaa !7
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}

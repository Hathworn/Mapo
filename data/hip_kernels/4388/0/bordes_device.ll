; ModuleID = '../data/hip_kernels/4388/0/main.cu'
source_filename = "../data/hip_kernels/4388/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6bordesPiS_ii(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %7, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = icmp slt i32 %21, %2
  %23 = icmp slt i32 %13, %3
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %85

25:                                               ; preds = %4
  %26 = add nsw i32 %21, -1
  %27 = mul nsw i32 %26, %3
  %28 = add nsw i32 %27, %13
  %29 = mul nsw i32 %21, %3
  %30 = add i32 %29, %13
  %31 = add nsw i32 %30, -1
  %32 = add i32 %30, 1
  %33 = add nsw i32 %21, 1
  %34 = mul nsw i32 %33, %3
  %35 = add nsw i32 %34, %13
  %36 = sext i32 %30 to i64
  %37 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %36
  %38 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %36
  store i32 %38, i32 addrspace(1)* %39, align 4, !tbaa !7
  %40 = icmp sgt i32 %21, 0
  br i1 %40, label %41, label %85

41:                                               ; preds = %25
  %42 = add nsw i32 %2, -1
  %43 = icmp slt i32 %21, %42
  %44 = icmp sgt i32 %13, 0
  %45 = select i1 %43, i1 %44, i1 false
  %46 = add nsw i32 %3, -1
  %47 = icmp slt i32 %13, %46
  %48 = select i1 %45, i1 %47, i1 false
  br i1 %48, label %49, label %85

49:                                               ; preds = %41
  %50 = sext i32 %28 to i64
  %51 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %50
  %52 = load i32, i32 addrspace(1)* %51, align 4, !tbaa !7
  %53 = sext i32 %31 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7
  %56 = load i32, i32 addrspace(1)* %37, align 4, !tbaa !7
  %57 = sext i32 %32 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7
  %60 = sext i32 %35 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !7
  %63 = sitofp i32 %52 to float
  %64 = fptosi float %63 to i32
  %65 = sitofp i32 %55 to float
  %66 = sitofp i32 %64 to float
  %67 = fadd contract float %65, %66
  %68 = fptosi float %67 to i32
  %69 = mul nsw i32 %56, -4
  %70 = sitofp i32 %69 to float
  %71 = sitofp i32 %68 to float
  %72 = fadd contract float %70, %71
  %73 = fptosi float %72 to i32
  %74 = sitofp i32 %59 to float
  %75 = sitofp i32 %73 to float
  %76 = fadd contract float %74, %75
  %77 = fptosi float %76 to i32
  %78 = sitofp i32 %62 to float
  %79 = sitofp i32 %77 to float
  %80 = fadd contract float %78, %79
  %81 = fptosi float %80 to i32
  %82 = tail call i32 @llvm.abs.i32(i32 %81, i1 true)
  %83 = sitofp i32 %82 to float
  %84 = fptosi float %83 to i32
  store i32 %84, i32 addrspace(1)* %39, align 4, !tbaa !7
  br label %85

85:                                               ; preds = %25, %41, %49, %4
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.abs.i32(i32, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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

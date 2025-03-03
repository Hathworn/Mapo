; ModuleID = '../data/hip_kernels/9824/0/main.cu'
source_filename = "../data/hip_kernels/9824/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13_medianfilterPKiPiE5cache = internal unnamed_addr addrspace(3) global [260 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13_medianfilterPKiPi(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !5, !invariant.load !6
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = add i32 %10, %3
  %12 = add nuw nsw i32 %3, 2
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %13
  %15 = load i32, i32 addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !6
  %16 = getelementptr inbounds [260 x i32], [260 x i32] addrspace(3)* @_ZZ13_medianfilterPKiPiE5cache, i32 0, i32 %12
  store i32 %15, i32 addrspace(3)* %16, align 4, !tbaa !7
  %17 = icmp ult i32 %3, 2
  br i1 %17, label %18, label %30

18:                                               ; preds = %2
  %19 = add nsw i32 %11, -2
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %20
  %22 = load i32, i32 addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !6
  %23 = getelementptr inbounds [260 x i32], [260 x i32] addrspace(3)* @_ZZ13_medianfilterPKiPiE5cache, i32 0, i32 %3
  store i32 %22, i32 addrspace(3)* %23, align 4, !tbaa !7
  %24 = add nsw i32 %11, 256
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !6
  %28 = add nuw nsw i32 %3, 258
  %29 = getelementptr inbounds [260 x i32], [260 x i32] addrspace(3)* @_ZZ13_medianfilterPKiPiE5cache, i32 0, i32 %28
  store i32 %27, i32 addrspace(3)* %29, align 4, !tbaa !7
  br label %30

30:                                               ; preds = %18, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %31 = getelementptr inbounds [260 x i32], [260 x i32] addrspace(3)* @_ZZ13_medianfilterPKiPiE5cache, i32 0, i32 %3
  %32 = bitcast i32 addrspace(3)* %31 to <2 x i32> addrspace(3)*
  %33 = load <2 x i32>, <2 x i32> addrspace(3)* %32, align 4, !tbaa !7
  %34 = shufflevector <2 x i32> %33, <2 x i32> poison, <5 x i32> <i32 0, i32 1, i32 undef, i32 undef, i32 undef>
  %35 = load i32, i32 addrspace(3)* %16, align 4, !tbaa !7
  %36 = insertelement <5 x i32> %34, i32 %35, i64 2
  %37 = add nuw nsw i32 %3, 3
  %38 = getelementptr inbounds [260 x i32], [260 x i32] addrspace(3)* @_ZZ13_medianfilterPKiPiE5cache, i32 0, i32 %37
  %39 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !7
  %40 = insertelement <5 x i32> %36, i32 %39, i64 3
  %41 = add nuw nsw i32 %3, 4
  %42 = getelementptr inbounds [260 x i32], [260 x i32] addrspace(3)* @_ZZ13_medianfilterPKiPiE5cache, i32 0, i32 %41
  %43 = load i32, i32 addrspace(3)* %42, align 4, !tbaa !7
  %44 = insertelement <5 x i32> %40, i32 %43, i64 4
  %45 = extractelement <2 x i32> %33, i64 0
  %46 = extractelement <2 x i32> %33, i64 1
  %47 = icmp slt i32 %46, %45
  %48 = zext i1 %47 to i32
  %49 = extractelement <5 x i32> %44, i32 %48
  %50 = icmp slt i32 %35, %49
  %51 = select i1 %50, i32 2, i32 %48
  %52 = extractelement <5 x i32> %44, i32 %51
  %53 = icmp slt i32 %39, %52
  %54 = select i1 %53, i32 3, i32 %51
  %55 = extractelement <5 x i32> %44, i32 %54
  %56 = icmp slt i32 %43, %55
  %57 = select i1 %56, i32 4, i32 %54
  %58 = extractelement <5 x i32> %44, i32 %57
  %59 = insertelement <5 x i32> %44, i32 %58, i64 0
  %60 = insertelement <5 x i32> %59, i32 %45, i32 %57
  %61 = extractelement <5 x i32> %60, i64 2
  %62 = extractelement <5 x i32> %60, i64 1
  %63 = icmp slt i32 %61, %62
  %64 = select i1 %63, i32 2, i32 1
  %65 = extractelement <5 x i32> %60, i64 3
  %66 = extractelement <5 x i32> %60, i32 %64
  %67 = icmp slt i32 %65, %66
  %68 = select i1 %67, i32 3, i32 %64
  %69 = extractelement <5 x i32> %60, i64 4
  %70 = extractelement <5 x i32> %60, i32 %68
  %71 = icmp slt i32 %69, %70
  %72 = select i1 %71, i32 4, i32 %68
  %73 = extractelement <5 x i32> %60, i32 %72
  %74 = insertelement <5 x i32> %60, i32 %73, i64 1
  %75 = insertelement <5 x i32> %74, i32 %62, i32 %72
  %76 = extractelement <5 x i32> %75, i64 3
  %77 = extractelement <5 x i32> %75, i64 2
  %78 = icmp slt i32 %76, %77
  %79 = select i1 %78, i32 3, i32 2
  %80 = extractelement <5 x i32> %75, i64 4
  %81 = extractelement <5 x i32> %75, i32 %79
  %82 = icmp slt i32 %80, %81
  %83 = select i1 %82, i32 4, i32 %79
  %84 = extractelement <5 x i32> %75, i32 %83
  %85 = insertelement <5 x i32> poison, i32 %84, i64 2
  %86 = insertelement <5 x i32> %85, i32 %77, i32 %83
  %87 = extractelement <5 x i32> %86, i64 2
  %88 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %13
  store i32 %87, i32 addrspace(1)* %88, align 4, !tbaa !7
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

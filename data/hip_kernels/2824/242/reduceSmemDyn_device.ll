; ModuleID = '../data/hip_kernels/2824/242/main.cu'
source_filename = "../data/hip_kernels/2824/242/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@smem = external hidden addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13reduceSmemDynPiS_j(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = zext i32 %11 to i64
  %13 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %12
  %14 = zext i32 %4 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %13, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %4
  store i32 %16, i32 addrspace(3)* %17, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %18 = icmp ugt i16 %9, 1023
  %19 = icmp ult i32 %4, 512
  %20 = select i1 %18, i1 %19, i1 false
  br i1 %20, label %21, label %27

21:                                               ; preds = %3
  %22 = add nuw nsw i32 %4, 512
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %22
  %24 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !7
  %25 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %26 = add nsw i32 %25, %24
  store i32 %26, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %27

27:                                               ; preds = %21, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %28 = icmp ugt i16 %9, 511
  %29 = icmp ult i32 %4, 256
  %30 = select i1 %28, i1 %29, i1 false
  br i1 %30, label %31, label %37

31:                                               ; preds = %27
  %32 = add nuw nsw i32 %4, 256
  %33 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %32
  %34 = load i32, i32 addrspace(3)* %33, align 4, !tbaa !7
  %35 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %36 = add nsw i32 %35, %34
  store i32 %36, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %37

37:                                               ; preds = %31, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp ugt i16 %9, 255
  %39 = icmp ult i32 %4, 128
  %40 = select i1 %38, i1 %39, i1 false
  br i1 %40, label %41, label %47

41:                                               ; preds = %37
  %42 = add nuw nsw i32 %4, 128
  %43 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %42
  %44 = load i32, i32 addrspace(3)* %43, align 4, !tbaa !7
  %45 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %46 = add nsw i32 %45, %44
  store i32 %46, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %47

47:                                               ; preds = %41, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %48 = icmp ugt i16 %9, 127
  %49 = icmp ult i32 %4, 64
  %50 = select i1 %48, i1 %49, i1 false
  br i1 %50, label %51, label %57

51:                                               ; preds = %47
  %52 = add nuw nsw i32 %4, 64
  %53 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %52
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !7
  %55 = load i32, i32 addrspace(3)* %17, align 4, !tbaa !7
  %56 = add nsw i32 %55, %54
  store i32 %56, i32 addrspace(3)* %17, align 4, !tbaa !7
  br label %57

57:                                               ; preds = %51, %47
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = icmp ult i32 %4, 32
  br i1 %58, label %59, label %97

59:                                               ; preds = %57
  %60 = add nuw nsw i32 %4, 32
  %61 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %60
  %62 = addrspacecast i32 addrspace(3)* %61 to i32*
  %63 = load volatile i32, i32* %62, align 4, !tbaa !7
  %64 = addrspacecast i32 addrspace(3)* %17 to i32*
  %65 = load volatile i32, i32* %64, align 4, !tbaa !7
  %66 = add nsw i32 %65, %63
  store volatile i32 %66, i32* %64, align 4, !tbaa !7
  %67 = add nuw nsw i32 %4, 16
  %68 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %67
  %69 = addrspacecast i32 addrspace(3)* %68 to i32*
  %70 = load volatile i32, i32* %69, align 4, !tbaa !7
  %71 = load volatile i32, i32* %64, align 4, !tbaa !7
  %72 = add nsw i32 %71, %70
  store volatile i32 %72, i32* %64, align 4, !tbaa !7
  %73 = add nuw nsw i32 %4, 8
  %74 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %73
  %75 = addrspacecast i32 addrspace(3)* %74 to i32*
  %76 = load volatile i32, i32* %75, align 4, !tbaa !7
  %77 = load volatile i32, i32* %64, align 4, !tbaa !7
  %78 = add nsw i32 %77, %76
  store volatile i32 %78, i32* %64, align 4, !tbaa !7
  %79 = add nuw nsw i32 %4, 4
  %80 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %79
  %81 = addrspacecast i32 addrspace(3)* %80 to i32*
  %82 = load volatile i32, i32* %81, align 4, !tbaa !7
  %83 = load volatile i32, i32* %64, align 4, !tbaa !7
  %84 = add nsw i32 %83, %82
  store volatile i32 %84, i32* %64, align 4, !tbaa !7
  %85 = add nuw nsw i32 %4, 2
  %86 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %85
  %87 = addrspacecast i32 addrspace(3)* %86 to i32*
  %88 = load volatile i32, i32* %87, align 4, !tbaa !7
  %89 = load volatile i32, i32* %64, align 4, !tbaa !7
  %90 = add nsw i32 %89, %88
  store volatile i32 %90, i32* %64, align 4, !tbaa !7
  %91 = add nuw nsw i32 %4, 1
  %92 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 %91
  %93 = addrspacecast i32 addrspace(3)* %92 to i32*
  %94 = load volatile i32, i32* %93, align 4, !tbaa !7
  %95 = load volatile i32, i32* %64, align 4, !tbaa !7
  %96 = add nsw i32 %95, %94
  store volatile i32 %96, i32* %64, align 4, !tbaa !7
  br label %97

97:                                               ; preds = %59, %57
  %98 = icmp eq i32 %4, 0
  br i1 %98, label %99, label %103

99:                                               ; preds = %97
  %100 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @smem, i32 0, i32 0), align 4, !tbaa !7
  %101 = zext i32 %5 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %101
  store i32 %100, i32 addrspace(1)* %102, align 4, !tbaa !7
  br label %103

103:                                              ; preds = %99, %97
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

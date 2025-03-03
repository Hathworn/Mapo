; ModuleID = '../data/hip_kernels/17363/27/main.cu'
source_filename = "../data/hip_kernels/17363/27/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10kernel_bfsPiS_S_S_S_PbiiiiiiS0_S_(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4, i8 addrspace(1)* nocapture %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i8 addrspace(1)* nocapture writeonly %12, i32 addrspace(1)* nocapture readonly %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = and i32 %15, 16777215
  %22 = mul i32 %21, %20
  %23 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %24 = add i32 %22, %23
  %25 = icmp slt i32 %24, %6
  br i1 %25, label %26, label %90

26:                                               ; preds = %14
  %27 = sext i32 %24 to i64
  %28 = getelementptr inbounds i8, i8 addrspace(1)* %5, i64 %27
  %29 = load i8, i8 addrspace(1)* %28, align 1, !tbaa !7, !range !11, !amdgpu.noclobber !5
  %30 = icmp eq i8 %29, 0
  br i1 %30, label %90, label %31

31:                                               ; preds = %26
  %32 = freeze i32 %24
  %33 = freeze i32 %10
  %34 = sdiv i32 %32, %33
  %35 = mul i32 %34, %33
  %36 = sub i32 %32, %35
  %37 = add nsw i32 %7, -1
  %38 = icmp slt i32 %36, %37
  %39 = icmp sgt i32 %36, 0
  %40 = and i1 %38, %39
  br i1 %40, label %41, label %90

41:                                               ; preds = %31
  %42 = add nsw i32 %8, -1
  %43 = icmp slt i32 %34, %42
  %44 = icmp sgt i32 %34, 0
  %45 = and i1 %43, %44
  br i1 %45, label %46, label %90

46:                                               ; preds = %41
  %47 = add nsw i32 %24, 1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %48
  %50 = load i32, i32 addrspace(1)* %49, align 4, !tbaa !12, !amdgpu.noclobber !5
  %51 = add nsw i32 %24, -1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !12, !amdgpu.noclobber !5
  %55 = add nsw i32 %24, %10
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %56
  %58 = load i32, i32 addrspace(1)* %57, align 4, !tbaa !12, !amdgpu.noclobber !5
  %59 = sub nsw i32 %24, %10
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %60
  %62 = load i32, i32 addrspace(1)* %61, align 4, !tbaa !12, !amdgpu.noclobber !5
  %63 = load i32, i32 addrspace(1)* %13, align 4, !tbaa !12, !amdgpu.noclobber !5
  %64 = icmp eq i32 %54, %63
  br i1 %64, label %65, label %69

65:                                               ; preds = %46
  %66 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %52
  %67 = load i32, i32 addrspace(1)* %66, align 4, !tbaa !12, !amdgpu.noclobber !5
  %68 = icmp sgt i32 %67, 0
  br i1 %68, label %87, label %69

69:                                               ; preds = %65, %46
  %70 = icmp eq i32 %58, %63
  br i1 %70, label %71, label %75

71:                                               ; preds = %69
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %56
  %73 = load i32, i32 addrspace(1)* %72, align 4, !tbaa !12, !amdgpu.noclobber !5
  %74 = icmp sgt i32 %73, 0
  br i1 %74, label %87, label %75

75:                                               ; preds = %71, %69
  %76 = icmp eq i32 %50, %63
  br i1 %76, label %77, label %81

77:                                               ; preds = %75
  %78 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %48
  %79 = load i32, i32 addrspace(1)* %78, align 4, !tbaa !12, !amdgpu.noclobber !5
  %80 = icmp sgt i32 %79, 0
  br i1 %80, label %87, label %81

81:                                               ; preds = %77, %75
  %82 = icmp eq i32 %62, %63
  br i1 %82, label %83, label %90

83:                                               ; preds = %81
  %84 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %60
  %85 = load i32, i32 addrspace(1)* %84, align 4, !tbaa !12, !amdgpu.noclobber !5
  %86 = icmp sgt i32 %85, 0
  br i1 %86, label %87, label %90

87:                                               ; preds = %83, %77, %71, %65
  %88 = add nsw i32 %63, 1
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %27
  store i32 %88, i32 addrspace(1)* %89, align 4, !tbaa !12
  store i8 0, i8 addrspace(1)* %28, align 1, !tbaa !7
  store i8 1, i8 addrspace(1)* %12, align 1, !tbaa !7
  br label %90

90:                                               ; preds = %31, %41, %87, %83, %81, %26, %14
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
!8 = !{!"bool", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i8 0, i8 2}
!12 = !{!13, !13, i64 0}
!13 = !{!"int", !9, i64 0}

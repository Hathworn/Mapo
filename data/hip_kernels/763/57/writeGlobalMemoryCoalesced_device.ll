; ModuleID = '../data/hip_kernels/763/57/main.cu'
source_filename = "../data/hip_kernels/763/57/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind writeonly
define protected amdgpu_kernel void @_Z26writeGlobalMemoryCoalescedPfii(float addrspace(1)* nocapture writeonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, %9
  %12 = add i32 %11, %4
  %13 = icmp sgt i32 %2, 0
  br i1 %13, label %14, label %87

14:                                               ; preds = %3
  %15 = sitofp i32 %12 to float
  %16 = add nsw i32 %1, -1
  br label %17

17:                                               ; preds = %14, %17
  %18 = phi i32 [ %12, %14 ], [ %84, %17 ]
  %19 = phi i32 [ 0, %14 ], [ %85, %17 ]
  %20 = and i32 %18, %16
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, float addrspace(1)* %0, i64 %21
  store float %15, float addrspace(1)* %22, align 4, !tbaa !7
  %23 = add nsw i32 %18, 32768
  %24 = and i32 %23, %16
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds float, float addrspace(1)* %0, i64 %25
  store float %15, float addrspace(1)* %26, align 4, !tbaa !7
  %27 = add nsw i32 %18, 65536
  %28 = and i32 %27, %16
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %0, i64 %29
  store float %15, float addrspace(1)* %30, align 4, !tbaa !7
  %31 = add nsw i32 %18, 98304
  %32 = and i32 %31, %16
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %0, i64 %33
  store float %15, float addrspace(1)* %34, align 4, !tbaa !7
  %35 = add nsw i32 %18, 131072
  %36 = and i32 %35, %16
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  store float %15, float addrspace(1)* %38, align 4, !tbaa !7
  %39 = add nsw i32 %18, 163840
  %40 = and i32 %39, %16
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  store float %15, float addrspace(1)* %42, align 4, !tbaa !7
  %43 = add nsw i32 %18, 196608
  %44 = and i32 %43, %16
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %0, i64 %45
  store float %15, float addrspace(1)* %46, align 4, !tbaa !7
  %47 = add nsw i32 %18, 229376
  %48 = and i32 %47, %16
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  store float %15, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = add nsw i32 %18, 262144
  %52 = and i32 %51, %16
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %0, i64 %53
  store float %15, float addrspace(1)* %54, align 4, !tbaa !7
  %55 = add nsw i32 %18, 294912
  %56 = and i32 %55, %16
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %0, i64 %57
  store float %15, float addrspace(1)* %58, align 4, !tbaa !7
  %59 = add nsw i32 %18, 327680
  %60 = and i32 %59, %16
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %0, i64 %61
  store float %15, float addrspace(1)* %62, align 4, !tbaa !7
  %63 = add nsw i32 %18, 360448
  %64 = and i32 %63, %16
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %0, i64 %65
  store float %15, float addrspace(1)* %66, align 4, !tbaa !7
  %67 = add nsw i32 %18, 393216
  %68 = and i32 %67, %16
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %0, i64 %69
  store float %15, float addrspace(1)* %70, align 4, !tbaa !7
  %71 = add nsw i32 %18, 425984
  %72 = and i32 %71, %16
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %0, i64 %73
  store float %15, float addrspace(1)* %74, align 4, !tbaa !7
  %75 = add nsw i32 %18, 458752
  %76 = and i32 %75, %16
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  store float %15, float addrspace(1)* %78, align 4, !tbaa !7
  %79 = add nsw i32 %18, 491520
  %80 = and i32 %79, %16
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %0, i64 %81
  store float %15, float addrspace(1)* %82, align 4, !tbaa !7
  %83 = add nsw i32 %18, 524288
  %84 = and i32 %83, %16
  %85 = add nuw nsw i32 %19, 1
  %86 = icmp eq i32 %85, %2
  br i1 %86, label %87, label %17, !llvm.loop !11

87:                                               ; preds = %17, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}

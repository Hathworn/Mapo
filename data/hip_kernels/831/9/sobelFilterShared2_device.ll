; ModuleID = '../data/hip_kernels/831/9/main.cu'
source_filename = "../data/hip_kernels/831/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Global_Mask = protected addrspace(4) externally_initialized global [9 x i8] zeroinitializer, align 1
@_ZZ18sobelFilterShared2PhS_iiE6s_data = internal unnamed_addr addrspace(3) global [1216 x i32] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i32 0, i32 0) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18sobelFilterShared2PhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !5, !invariant.load !6
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %15 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %16 = bitcast i8 addrspace(4)* %15 to i16 addrspace(4)*
  %17 = load i16, i16 addrspace(4)* %16, align 2, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  %19 = mul i32 %14, %18
  %20 = add i32 %19, %5
  %21 = mul i32 %20, %2
  %22 = add i32 %13, %6
  %23 = add i32 %22, %21
  %24 = shl nuw nsw i32 %5, 5
  %25 = icmp slt i32 %20, 1
  br i1 %25, label %32, label %26

26:                                               ; preds = %4
  %27 = sub nsw i32 %23, %2
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !6
  %31 = zext i8 %30 to i32
  br label %32

32:                                               ; preds = %4, %26
  %33 = phi i32 [ %31, %26 ], [ 0, %4 ]
  %34 = add nuw nsw i32 %24, %6
  %35 = getelementptr inbounds [1216 x i32], [1216 x i32] addrspace(3)* @_ZZ18sobelFilterShared2PhS_iiE6s_data, i32 0, i32 %34
  store i32 %33, i32 addrspace(3)* %35, align 4, !tbaa !10
  %36 = icmp sgt i32 %20, %3
  br i1 %36, label %43, label %37

37:                                               ; preds = %32
  %38 = add nsw i32 %23, %2
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !6
  %42 = zext i8 %41 to i32
  br label %43

43:                                               ; preds = %32, %37
  %44 = phi i32 [ %42, %37 ], [ 0, %32 ]
  %45 = add nuw nsw i32 %5, %18
  %46 = shl nuw nsw i32 %45, 5
  %47 = add nuw nsw i32 %46, %6
  %48 = getelementptr inbounds [1216 x i32], [1216 x i32] addrspace(3)* @_ZZ18sobelFilterShared2PhS_iiE6s_data, i32 0, i32 %47
  store i32 %44, i32 addrspace(3)* %48, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = add nuw nsw i32 %24, %6
  %50 = getelementptr inbounds [1216 x i32], [1216 x i32] addrspace(3)* @_ZZ18sobelFilterShared2PhS_iiE6s_data, i32 0, i32 %49
  %51 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !10
  %52 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 0), align 1, !tbaa !7
  %53 = zext i8 %52 to i32
  %54 = mul i32 %51, %53
  %55 = shl nuw nsw i32 %5, 5
  %56 = add nuw nsw i32 %55, 32
  %57 = add nuw nsw i32 %56, %6
  %58 = getelementptr inbounds [1216 x i32], [1216 x i32] addrspace(3)* @_ZZ18sobelFilterShared2PhS_iiE6s_data, i32 0, i32 %57
  %59 = load i32, i32 addrspace(3)* %58, align 4, !tbaa !10
  %60 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 1), align 1, !tbaa !7
  %61 = zext i8 %60 to i32
  %62 = mul i32 %59, %61
  %63 = add i32 %62, %54
  %64 = shl nuw nsw i32 %5, 5
  %65 = add nuw nsw i32 %64, 64
  %66 = add nuw nsw i32 %65, %6
  %67 = getelementptr inbounds [1216 x i32], [1216 x i32] addrspace(3)* @_ZZ18sobelFilterShared2PhS_iiE6s_data, i32 0, i32 %66
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !10
  %69 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 2), align 1, !tbaa !7
  %70 = zext i8 %69 to i32
  %71 = mul i32 %68, %70
  %72 = add i32 %71, %63
  %73 = trunc i32 %72 to i8
  %74 = sext i32 %23 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %74
  store i8 %73, i8 addrspace(1)* %75, align 1, !tbaa !7
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}

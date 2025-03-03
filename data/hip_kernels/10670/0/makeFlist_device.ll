; ModuleID = '../data/hip_kernels/10670/0/main.cu'
source_filename = "../data/hip_kernels/10670/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9makeFlistPjS_S_jjE13private_items = internal addrspace(3) global [12000 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9makeFlistPjS_S_jj(i32 addrspace(1)* nocapture readnone %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %13 = mul i32 %12, %11
  %14 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %6
  store i32 0, i32 addrspace(3)* %14, align 4, !tbaa !7
  %15 = add nuw nsw i32 %6, %11
  %16 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %15
  store i32 0, i32 addrspace(3)* %16, align 4, !tbaa !7
  %17 = shl nuw nsw i32 %11, 1
  %18 = add nuw nsw i32 %17, %6
  %19 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %18
  store i32 0, i32 addrspace(3)* %19, align 4, !tbaa !7
  %20 = mul nuw nsw i32 %11, 3
  %21 = add nuw nsw i32 %20, %6
  %22 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %21
  store i32 0, i32 addrspace(3)* %22, align 4, !tbaa !7
  %23 = shl nuw nsw i32 %11, 2
  %24 = add nuw nsw i32 %23, %6
  %25 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %24
  store i32 0, i32 addrspace(3)* %25, align 4, !tbaa !7
  %26 = mul nuw nsw i32 %11, 5
  %27 = add nuw nsw i32 %26, %6
  %28 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %27
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !7
  %29 = mul nuw nsw i32 %11, 6
  %30 = add nuw nsw i32 %29, %6
  %31 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %30
  store i32 0, i32 addrspace(3)* %31, align 4, !tbaa !7
  %32 = mul nuw nsw i32 %11, 7
  %33 = add nuw nsw i32 %32, %6
  %34 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %33
  store i32 0, i32 addrspace(3)* %34, align 4, !tbaa !7
  %35 = shl nuw nsw i32 %11, 3
  %36 = add nuw nsw i32 %35, %6
  %37 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %36
  store i32 0, i32 addrspace(3)* %37, align 4, !tbaa !7
  %38 = mul nuw nsw i32 %11, 9
  %39 = add nuw nsw i32 %38, %6
  %40 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %39
  store i32 0, i32 addrspace(3)* %40, align 4, !tbaa !7
  %41 = mul nuw nsw i32 %11, 10
  %42 = add nuw nsw i32 %41, %6
  %43 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %42
  store i32 0, i32 addrspace(3)* %43, align 4, !tbaa !7
  %44 = mul nuw nsw i32 %11, 11
  %45 = add nuw nsw i32 %44, %6
  %46 = icmp ult i32 %45, 12000
  br i1 %46, label %47, label %49

47:                                               ; preds = %5
  %48 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %45
  store i32 0, i32 addrspace(3)* %48, align 4, !tbaa !7
  br label %49

49:                                               ; preds = %47, %5
  %50 = add i32 %13, %6
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %51 = icmp ult i32 %50, %4
  br i1 %51, label %52, label %60

52:                                               ; preds = %49
  %53 = sext i32 %50 to i64
  %54 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %53
  %55 = load i32, i32 addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = icmp ult i32 %55, 12000
  br i1 %56, label %57, label %60

57:                                               ; preds = %52
  %58 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %55
  %59 = atomicrmw add i32 addrspace(3)* %58, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %60

60:                                               ; preds = %57, %52, %49
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %61 = zext i32 %6 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %61
  %63 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %6
  %64 = load i32, i32 addrspace(3)* %63, align 4, !tbaa !7
  %65 = atomicrmw add i32 addrspace(1)* %62, i32 %64 syncscope("agent-one-as") monotonic, align 4
  %66 = zext i32 %15 to i64
  %67 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %66
  %68 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %15
  %69 = load i32, i32 addrspace(3)* %68, align 4, !tbaa !7
  %70 = atomicrmw add i32 addrspace(1)* %67, i32 %69 syncscope("agent-one-as") monotonic, align 4
  %71 = zext i32 %18 to i64
  %72 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %71
  %73 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %18
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !7
  %75 = atomicrmw add i32 addrspace(1)* %72, i32 %74 syncscope("agent-one-as") monotonic, align 4
  %76 = zext i32 %21 to i64
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %76
  %78 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %21
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  %80 = atomicrmw add i32 addrspace(1)* %77, i32 %79 syncscope("agent-one-as") monotonic, align 4
  %81 = zext i32 %24 to i64
  %82 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %81
  %83 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %24
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %85 = atomicrmw add i32 addrspace(1)* %82, i32 %84 syncscope("agent-one-as") monotonic, align 4
  %86 = zext i32 %27 to i64
  %87 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %86
  %88 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %27
  %89 = load i32, i32 addrspace(3)* %88, align 4, !tbaa !7
  %90 = atomicrmw add i32 addrspace(1)* %87, i32 %89 syncscope("agent-one-as") monotonic, align 4
  %91 = zext i32 %30 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %91
  %93 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %30
  %94 = load i32, i32 addrspace(3)* %93, align 4, !tbaa !7
  %95 = atomicrmw add i32 addrspace(1)* %92, i32 %94 syncscope("agent-one-as") monotonic, align 4
  %96 = zext i32 %33 to i64
  %97 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %96
  %98 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %33
  %99 = load i32, i32 addrspace(3)* %98, align 4, !tbaa !7
  %100 = atomicrmw add i32 addrspace(1)* %97, i32 %99 syncscope("agent-one-as") monotonic, align 4
  %101 = zext i32 %36 to i64
  %102 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %101
  %103 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %36
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !7
  %105 = atomicrmw add i32 addrspace(1)* %102, i32 %104 syncscope("agent-one-as") monotonic, align 4
  %106 = zext i32 %39 to i64
  %107 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %106
  %108 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %39
  %109 = load i32, i32 addrspace(3)* %108, align 4, !tbaa !7
  %110 = atomicrmw add i32 addrspace(1)* %107, i32 %109 syncscope("agent-one-as") monotonic, align 4
  %111 = zext i32 %42 to i64
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %111
  %113 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %42
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !7
  %115 = atomicrmw add i32 addrspace(1)* %112, i32 %114 syncscope("agent-one-as") monotonic, align 4
  br i1 %46, label %116, label %122

116:                                              ; preds = %60
  %117 = zext i32 %45 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %117
  %119 = getelementptr inbounds [12000 x i32], [12000 x i32] addrspace(3)* @_ZZ9makeFlistPjS_S_jjE13private_items, i32 0, i32 %45
  %120 = load i32, i32 addrspace(3)* %119, align 4, !tbaa !7
  %121 = atomicrmw add i32 addrspace(1)* %118, i32 %120 syncscope("agent-one-as") monotonic, align 4
  br label %122

122:                                              ; preds = %116, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
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

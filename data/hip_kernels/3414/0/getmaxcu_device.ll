; ModuleID = '../data/hip_kernels/3414/0/main.cu'
source_filename = "../data/hip_kernels/3414/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ8getmaxcuPjiiE12localBiggest = internal unnamed_addr addrspace(3) global [32 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z8getmaxcuPjii(i32 addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %6, label %7

6:                                                ; preds = %3
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 0), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 1), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 2), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 3), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 4), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 5), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 6), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 7), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 8), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 9), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 10), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 11), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 12), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 13), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 14), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 15), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 16), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 17), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 18), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 19), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 20), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 21), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 22), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 23), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 24), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 25), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 26), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 27), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 28), align 16, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 29), align 4, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 30), align 8, !tbaa !5
  store i32 0, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 31), align 4, !tbaa !5
  br label %7

7:                                                ; preds = %6, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !9, !invariant.load !10
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %4
  %16 = lshr i32 %4, 5
  %17 = sext i32 %15 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !10
  %20 = getelementptr inbounds [32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 %16
  %21 = load i32, i32 addrspace(3)* %20, align 4, !tbaa !5
  %22 = icmp ugt i32 %19, %21
  %23 = icmp slt i32 %15, %1
  %24 = select i1 %22, i1 %23, i1 false
  br i1 %24, label %25, label %26

25:                                               ; preds = %7
  store i32 %19, i32 addrspace(3)* %20, align 4, !tbaa !5
  br label %26

26:                                               ; preds = %25, %7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %5, label %27, label %93

27:                                               ; preds = %26
  %28 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 0), align 16, !tbaa !5
  %29 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 1), align 4, !tbaa !5
  %30 = tail call i32 @llvm.smax.i32(i32 %28, i32 %29)
  %31 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 2), align 8, !tbaa !5
  %32 = tail call i32 @llvm.smax.i32(i32 %30, i32 %31)
  %33 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 3), align 4, !tbaa !5
  %34 = tail call i32 @llvm.smax.i32(i32 %32, i32 %33)
  %35 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 4), align 16, !tbaa !5
  %36 = tail call i32 @llvm.smax.i32(i32 %34, i32 %35)
  %37 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 5), align 4, !tbaa !5
  %38 = tail call i32 @llvm.smax.i32(i32 %36, i32 %37)
  %39 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 6), align 8, !tbaa !5
  %40 = tail call i32 @llvm.smax.i32(i32 %38, i32 %39)
  %41 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 7), align 4, !tbaa !5
  %42 = tail call i32 @llvm.smax.i32(i32 %40, i32 %41)
  %43 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 8), align 16, !tbaa !5
  %44 = tail call i32 @llvm.smax.i32(i32 %42, i32 %43)
  %45 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 9), align 4, !tbaa !5
  %46 = tail call i32 @llvm.smax.i32(i32 %44, i32 %45)
  %47 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 10), align 8, !tbaa !5
  %48 = tail call i32 @llvm.smax.i32(i32 %46, i32 %47)
  %49 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 11), align 4, !tbaa !5
  %50 = tail call i32 @llvm.smax.i32(i32 %48, i32 %49)
  %51 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 12), align 16, !tbaa !5
  %52 = tail call i32 @llvm.smax.i32(i32 %50, i32 %51)
  %53 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 13), align 4, !tbaa !5
  %54 = tail call i32 @llvm.smax.i32(i32 %52, i32 %53)
  %55 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 14), align 8, !tbaa !5
  %56 = tail call i32 @llvm.smax.i32(i32 %54, i32 %55)
  %57 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 15), align 4, !tbaa !5
  %58 = tail call i32 @llvm.smax.i32(i32 %56, i32 %57)
  %59 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 16), align 16, !tbaa !5
  %60 = tail call i32 @llvm.smax.i32(i32 %58, i32 %59)
  %61 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 17), align 4, !tbaa !5
  %62 = tail call i32 @llvm.smax.i32(i32 %60, i32 %61)
  %63 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 18), align 8, !tbaa !5
  %64 = tail call i32 @llvm.smax.i32(i32 %62, i32 %63)
  %65 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 19), align 4, !tbaa !5
  %66 = tail call i32 @llvm.smax.i32(i32 %64, i32 %65)
  %67 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 20), align 16, !tbaa !5
  %68 = tail call i32 @llvm.smax.i32(i32 %66, i32 %67)
  %69 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 21), align 4, !tbaa !5
  %70 = tail call i32 @llvm.smax.i32(i32 %68, i32 %69)
  %71 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 22), align 8, !tbaa !5
  %72 = tail call i32 @llvm.smax.i32(i32 %70, i32 %71)
  %73 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 23), align 4, !tbaa !5
  %74 = tail call i32 @llvm.smax.i32(i32 %72, i32 %73)
  %75 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 24), align 16, !tbaa !5
  %76 = tail call i32 @llvm.smax.i32(i32 %74, i32 %75)
  %77 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 25), align 4, !tbaa !5
  %78 = tail call i32 @llvm.smax.i32(i32 %76, i32 %77)
  %79 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 26), align 8, !tbaa !5
  %80 = tail call i32 @llvm.smax.i32(i32 %78, i32 %79)
  %81 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 27), align 4, !tbaa !5
  %82 = tail call i32 @llvm.smax.i32(i32 %80, i32 %81)
  %83 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 28), align 16, !tbaa !5
  %84 = tail call i32 @llvm.smax.i32(i32 %82, i32 %83)
  %85 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 29), align 4, !tbaa !5
  %86 = tail call i32 @llvm.smax.i32(i32 %84, i32 %85)
  %87 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 30), align 8, !tbaa !5
  %88 = tail call i32 @llvm.smax.i32(i32 %86, i32 %87)
  %89 = load i32, i32 addrspace(3)* getelementptr inbounds ([32 x i32], [32 x i32] addrspace(3)* @_ZZ8getmaxcuPjiiE12localBiggest, i32 0, i32 31), align 4, !tbaa !5
  %90 = tail call i32 @llvm.smax.i32(i32 %88, i32 %89)
  %91 = zext i32 %8 to i64
  %92 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %91
  store i32 %90, i32 addrspace(1)* %92, align 4, !tbaa !5
  br label %93

93:                                               ; preds = %27, %26
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}

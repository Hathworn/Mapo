; ModuleID = '../data/hip_kernels/831/8/main.cu'
source_filename = "../data/hip_kernels/831/8/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@Global_Mask = protected addrspace(4) externally_initialized global [9 x i8] zeroinitializer, align 1
@_ZZ17sobelFilterSharedPhS_iiE6s_data = internal unnamed_addr addrspace(3) global [38 x [38 x i32]] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i32 0, i32 0) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z17sobelFilterSharedPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !5, !invariant.load !6
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = add i32 %12, %5
  %14 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = add i32 %20, %14
  %22 = mul i32 %21, %2
  %23 = add i32 %22, %13
  %24 = icmp slt i32 %13, 1
  %25 = icmp slt i32 %21, 1
  %26 = select i1 %24, i1 true, i1 %25
  br i1 %26, label %36, label %27

27:                                               ; preds = %4
  %28 = sext i32 %23 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %29, i64 -1
  %31 = sext i32 %2 to i64
  %32 = sub nsw i64 0, %31
  %33 = getelementptr inbounds i8, i8 addrspace(1)* %30, i64 %32
  %34 = load i8, i8 addrspace(1)* %33, align 1, !tbaa !7, !amdgpu.noclobber !6
  %35 = zext i8 %34 to i32
  br label %36

36:                                               ; preds = %4, %27
  %37 = phi i32 [ %35, %27 ], [ 0, %4 ]
  %38 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %14, i32 %5
  store i32 %37, i32 addrspace(3)* %38, align 4
  %39 = add nsw i32 %2, -1
  %40 = icmp sge i32 %13, %39
  %41 = select i1 %40, i1 true, i1 %25
  br i1 %41, label %51, label %42

42:                                               ; preds = %36
  %43 = sext i32 %23 to i64
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %43
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %44, i64 1
  %46 = sext i32 %2 to i64
  %47 = sub nsw i64 0, %46
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %45, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !7, !amdgpu.noclobber !6
  %50 = zext i8 %49 to i32
  br label %51

51:                                               ; preds = %36, %42
  %52 = phi i32 [ %50, %42 ], [ 0, %36 ]
  %53 = add nuw nsw i32 %5, %11
  %54 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %14, i32 %53
  store i32 %52, i32 addrspace(3)* %54, align 4, !tbaa !10
  %55 = xor i1 %24, true
  %56 = add nsw i32 %3, -1
  %57 = icmp slt i32 %21, %56
  %58 = select i1 %55, i1 %57, i1 false
  br i1 %58, label %59, label %67

59:                                               ; preds = %51
  %60 = sext i32 %23 to i64
  %61 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %60
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %61, i64 -1
  %63 = sext i32 %2 to i64
  %64 = getelementptr inbounds i8, i8 addrspace(1)* %62, i64 %63
  %65 = load i8, i8 addrspace(1)* %64, align 1, !tbaa !7, !amdgpu.noclobber !6
  %66 = zext i8 %65 to i32
  br label %67

67:                                               ; preds = %51, %59
  %68 = phi i32 [ %66, %59 ], [ 0, %51 ]
  %69 = add nuw nsw i32 %14, %19
  %70 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %69, i32 %5
  store i32 %68, i32 addrspace(3)* %70, align 4, !tbaa !10
  %71 = xor i1 %40, true
  %72 = select i1 %71, i1 %57, i1 false
  br i1 %72, label %78, label %73

73:                                               ; preds = %67
  %74 = add nuw nsw i32 %14, %19
  %75 = add nuw nsw i32 %5, %11
  %76 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %74, i32 %75
  store i32 0, i32 addrspace(3)* %76, align 4, !tbaa !10
  %77 = sext i32 %23 to i64
  br label %89

78:                                               ; preds = %67
  %79 = sext i32 %23 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %79
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %80, i64 1
  %82 = sext i32 %2 to i64
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %81, i64 %82
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !7, !amdgpu.noclobber !6
  %85 = zext i8 %84 to i32
  %86 = add nuw nsw i32 %14, %19
  %87 = add nuw nsw i32 %5, %11
  %88 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %86, i32 %87
  store i32 %85, i32 addrspace(3)* %88, align 4, !tbaa !10
  br label %89

89:                                               ; preds = %78, %73
  %90 = phi i64 [ %79, %78 ], [ %77, %73 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %91 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 0), align 1, !tbaa !7
  %92 = zext i8 %91 to i32
  %93 = load i32, i32 addrspace(3)* %38, align 4, !tbaa !10
  %94 = mul i32 %93, %92
  %95 = mul i32 %94, %92
  %96 = add nuw nsw i32 %5, 1
  %97 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %14, i32 %96
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !10
  %99 = mul i32 %98, %92
  %100 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 1), align 1, !tbaa !7
  %101 = zext i8 %100 to i32
  %102 = mul i32 %99, %101
  %103 = add i32 %102, %95
  %104 = add nuw nsw i32 %5, 2
  %105 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %14, i32 %104
  %106 = load i32, i32 addrspace(3)* %105, align 4, !tbaa !10
  %107 = mul i32 %106, %92
  %108 = load i8, i8 addrspace(4)* getelementptr inbounds ([9 x i8], [9 x i8] addrspace(4)* @Global_Mask, i64 0, i64 2), align 1, !tbaa !7
  %109 = zext i8 %108 to i32
  %110 = mul i32 %107, %109
  %111 = add i32 %110, %103
  %112 = add nuw nsw i32 %14, 1
  %113 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %112, i32 %5
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !10
  %115 = mul i32 %114, %101
  %116 = mul i32 %115, %92
  %117 = add i32 %116, %111
  %118 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %112, i32 %96
  %119 = load i32, i32 addrspace(3)* %118, align 4, !tbaa !10
  %120 = mul i32 %119, %101
  %121 = mul i32 %120, %101
  %122 = add i32 %121, %117
  %123 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %112, i32 %104
  %124 = load i32, i32 addrspace(3)* %123, align 4, !tbaa !10
  %125 = mul i32 %124, %101
  %126 = mul i32 %125, %109
  %127 = add i32 %126, %122
  %128 = add nuw nsw i32 %14, 2
  %129 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %128, i32 %5
  %130 = load i32, i32 addrspace(3)* %129, align 4, !tbaa !10
  %131 = mul i32 %130, %109
  %132 = mul i32 %131, %92
  %133 = add i32 %132, %127
  %134 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %128, i32 %96
  %135 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !10
  %136 = mul i32 %135, %109
  %137 = mul i32 %136, %101
  %138 = add i32 %137, %133
  %139 = getelementptr inbounds [38 x [38 x i32]], [38 x [38 x i32]] addrspace(3)* @_ZZ17sobelFilterSharedPhS_iiE6s_data, i32 0, i32 %128, i32 %104
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !10
  %141 = mul i32 %140, %109
  %142 = mul i32 %141, %109
  %143 = add i32 %142, %138
  %144 = trunc i32 %143 to i8
  %145 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %90
  store i8 %144, i8 addrspace(1)* %145, align 1, !tbaa !7
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

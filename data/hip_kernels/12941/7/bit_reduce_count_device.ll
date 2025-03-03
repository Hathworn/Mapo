; ModuleID = '../data/hip_kernels/12941/7/main.cu'
source_filename = "../data/hip_kernels/12941/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@sharedMem = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z16bit_reduce_countPKjPjS1_t(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 addrspace(1)* nocapture writeonly %2, i16 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = lshr i32 %16, 8
  %18 = lshr i32 %16, 16
  %19 = lshr i32 %16, 24
  %20 = insertelement <4 x i32> poison, i32 %16, i64 0
  %21 = insertelement <4 x i32> %20, i32 %17, i64 1
  %22 = insertelement <4 x i32> %21, i32 %18, i64 2
  %23 = insertelement <4 x i32> %22, i32 %19, i64 3
  %24 = trunc <4 x i32> %23 to <4 x i8>
  %25 = icmp ult i32 %16, 256
  %26 = icmp ult i32 %16, 65536
  %27 = select i1 %26, i32 2, i32 4
  %28 = select i1 %25, i32 1, i32 %27
  %29 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %5
  store i32 %28, i32 addrspace(3)* %29, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %30 = icmp eq i32 %5, 1
  br i1 %30, label %31, label %96

31:                                               ; preds = %4
  %32 = icmp eq i16 %3, 0
  br i1 %32, label %54, label %33

33:                                               ; preds = %31
  %34 = zext i16 %3 to i32
  %35 = and i32 %34, 7
  %36 = icmp ult i16 %3, 8
  br i1 %36, label %39, label %37

37:                                               ; preds = %33
  %38 = and i32 %34, 65528
  br label %58

39:                                               ; preds = %58, %33
  %40 = phi i32 [ undef, %33 ], [ %92, %58 ]
  %41 = phi i32 [ 0, %33 ], [ %93, %58 ]
  %42 = phi i32 [ 0, %33 ], [ %92, %58 ]
  %43 = icmp eq i32 %35, 0
  br i1 %43, label %54, label %44

44:                                               ; preds = %39, %44
  %45 = phi i32 [ %51, %44 ], [ %41, %39 ]
  %46 = phi i32 [ %50, %44 ], [ %42, %39 ]
  %47 = phi i32 [ %52, %44 ], [ 0, %39 ]
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %45
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !7
  %50 = add i32 %49, %46
  store i32 %50, i32 addrspace(3)* %48, align 4, !tbaa !7
  %51 = add nuw nsw i32 %45, 1
  %52 = add i32 %47, 1
  %53 = icmp eq i32 %52, %35
  br i1 %53, label %54, label %44, !llvm.loop !11

54:                                               ; preds = %39, %44, %31
  %55 = phi i32 [ 0, %31 ], [ %40, %39 ], [ %50, %44 ]
  %56 = zext i32 %11 to i64
  %57 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %56
  store i32 %55, i32 addrspace(1)* %57, align 4, !tbaa !7
  br label %96

58:                                               ; preds = %58, %37
  %59 = phi i32 [ 0, %37 ], [ %93, %58 ]
  %60 = phi i32 [ 0, %37 ], [ %92, %58 ]
  %61 = phi i32 [ 0, %37 ], [ %94, %58 ]
  %62 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %59
  %63 = load i32, i32 addrspace(3)* %62, align 4, !tbaa !7
  %64 = add i32 %63, %60
  store i32 %64, i32 addrspace(3)* %62, align 4, !tbaa !7
  %65 = or i32 %59, 1
  %66 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %65
  %67 = load i32, i32 addrspace(3)* %66, align 4, !tbaa !7
  %68 = add i32 %67, %64
  store i32 %68, i32 addrspace(3)* %66, align 4, !tbaa !7
  %69 = or i32 %59, 2
  %70 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %69
  %71 = load i32, i32 addrspace(3)* %70, align 4, !tbaa !7
  %72 = add i32 %71, %68
  store i32 %72, i32 addrspace(3)* %70, align 4, !tbaa !7
  %73 = or i32 %59, 3
  %74 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %73
  %75 = load i32, i32 addrspace(3)* %74, align 4, !tbaa !7
  %76 = add i32 %75, %72
  store i32 %76, i32 addrspace(3)* %74, align 4, !tbaa !7
  %77 = or i32 %59, 4
  %78 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %77
  %79 = load i32, i32 addrspace(3)* %78, align 4, !tbaa !7
  %80 = add i32 %79, %76
  store i32 %80, i32 addrspace(3)* %78, align 4, !tbaa !7
  %81 = or i32 %59, 5
  %82 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %81
  %83 = load i32, i32 addrspace(3)* %82, align 4, !tbaa !7
  %84 = add i32 %83, %80
  store i32 %84, i32 addrspace(3)* %82, align 4, !tbaa !7
  %85 = or i32 %59, 6
  %86 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %85
  %87 = load i32, i32 addrspace(3)* %86, align 4, !tbaa !7
  %88 = add i32 %87, %84
  store i32 %88, i32 addrspace(3)* %86, align 4, !tbaa !7
  %89 = or i32 %59, 7
  %90 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @sharedMem, i32 0, i32 %89
  %91 = load i32, i32 addrspace(3)* %90, align 4, !tbaa !7
  %92 = add i32 %91, %88
  store i32 %92, i32 addrspace(3)* %90, align 4, !tbaa !7
  %93 = add nuw nsw i32 %59, 8
  %94 = add i32 %61, 8
  %95 = icmp eq i32 %94, %38
  br i1 %95, label %39, label %58, !llvm.loop !13

96:                                               ; preds = %54, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %97 = load i32, i32 addrspace(3)* %29, align 4, !tbaa !7
  %98 = sub nsw i32 %5, %28
  %99 = add i32 %98, %97
  %100 = zext i32 %12 to i64
  %101 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %100
  %102 = bitcast i32 addrspace(1)* %101 to i8 addrspace(1)*
  %103 = zext i32 %99 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %102, i64 %103
  br i1 %25, label %105, label %108

105:                                              ; preds = %96
  store i8 1, i8 addrspace(1)* %104, align 1, !tbaa !15
  %106 = getelementptr inbounds i8, i8 addrspace(1)* %104, i64 1
  %107 = extractelement <4 x i8> %24, i64 0
  store i8 %107, i8 addrspace(1)* %106, align 1, !tbaa !15
  br label %116

108:                                              ; preds = %96
  %109 = getelementptr inbounds i8, i8 addrspace(1)* %104, i64 1
  br i1 %26, label %110, label %114

110:                                              ; preds = %108
  store i8 2, i8 addrspace(1)* %104, align 1, !tbaa !15
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %109, i64 1
  %112 = extractelement <4 x i8> %24, i64 1
  store i8 %112, i8 addrspace(1)* %111, align 1, !tbaa !15
  %113 = extractelement <4 x i8> %24, i64 0
  store i8 %113, i8 addrspace(1)* %109, align 1, !tbaa !15
  br label %116

114:                                              ; preds = %108
  store i8 4, i8 addrspace(1)* %104, align 1, !tbaa !15
  %115 = bitcast i8 addrspace(1)* %109 to <4 x i8> addrspace(1)*
  store <4 x i8> %24, <4 x i8> addrspace(1)* %115, align 1, !tbaa !15
  br label %116

116:                                              ; preds = %110, %114, %105
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
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!9, !9, i64 0}

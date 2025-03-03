; ModuleID = '../data/hip_kernels/12922/3/main.cu'
source_filename = "../data/hip_kernels/12922/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@glb_hist = protected addrspace(1) externally_initialized global [256 x i32] zeroinitializer, align 16
@_ZZ14calc_histogramPhiiE4hist = internal addrspace(3) global [256 x i32] undef, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(1)* bitcast ([256 x i32] addrspace(1)* @glb_hist to i8 addrspace(1)*) to i8*)], section "llvm.metadata"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14calc_histogramPhii(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !6
  %13 = mul i32 %4, %9
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = add i32 %13, %14
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = icmp ult i32 %14, 256
  br i1 %22, label %23, label %25

23:                                               ; preds = %3
  %24 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %14
  store i32 0, i32 addrspace(3)* %24, align 4, !tbaa !16
  br label %25

25:                                               ; preds = %23, %3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = sub nsw i32 %2, %1
  %27 = freeze i32 %26
  %28 = freeze i32 %21
  %29 = sdiv i32 %27, %28
  %30 = mul i32 %29, %28
  %31 = sub i32 %27, %30
  %32 = icmp sgt i32 %29, 0
  br i1 %32, label %33, label %133

33:                                               ; preds = %25
  %34 = add i32 %15, %1
  %35 = and i32 %29, 7
  %36 = icmp ult i32 %29, 8
  br i1 %36, label %116, label %37

37:                                               ; preds = %33
  %38 = and i32 %29, -8
  br label %39

39:                                               ; preds = %39, %37
  %40 = phi i32 [ 0, %37 ], [ %113, %39 ]
  %41 = phi i32 [ 0, %37 ], [ %114, %39 ]
  %42 = mul nsw i32 %40, %21
  %43 = add i32 %34, %42
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %44
  %46 = load i8, i8 addrspace(1)* %45, align 1, !tbaa !20, !amdgpu.noclobber !5
  %47 = zext i8 %46 to i32
  %48 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %47
  %49 = atomicrmw add i32 addrspace(3)* %48, i32 1 syncscope("agent-one-as") monotonic, align 4
  %50 = or i32 %40, 1
  %51 = mul nsw i32 %50, %21
  %52 = add i32 %34, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %53
  %55 = load i8, i8 addrspace(1)* %54, align 1, !tbaa !20, !amdgpu.noclobber !5
  %56 = zext i8 %55 to i32
  %57 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %56
  %58 = atomicrmw add i32 addrspace(3)* %57, i32 1 syncscope("agent-one-as") monotonic, align 4
  %59 = or i32 %40, 2
  %60 = mul nsw i32 %59, %21
  %61 = add i32 %34, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %62
  %64 = load i8, i8 addrspace(1)* %63, align 1, !tbaa !20, !amdgpu.noclobber !5
  %65 = zext i8 %64 to i32
  %66 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %65
  %67 = atomicrmw add i32 addrspace(3)* %66, i32 1 syncscope("agent-one-as") monotonic, align 4
  %68 = or i32 %40, 3
  %69 = mul nsw i32 %68, %21
  %70 = add i32 %34, %69
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !20, !amdgpu.noclobber !5
  %74 = zext i8 %73 to i32
  %75 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %74
  %76 = atomicrmw add i32 addrspace(3)* %75, i32 1 syncscope("agent-one-as") monotonic, align 4
  %77 = or i32 %40, 4
  %78 = mul nsw i32 %77, %21
  %79 = add i32 %34, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  %82 = load i8, i8 addrspace(1)* %81, align 1, !tbaa !20, !amdgpu.noclobber !5
  %83 = zext i8 %82 to i32
  %84 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %83
  %85 = atomicrmw add i32 addrspace(3)* %84, i32 1 syncscope("agent-one-as") monotonic, align 4
  %86 = or i32 %40, 5
  %87 = mul nsw i32 %86, %21
  %88 = add i32 %34, %87
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %89
  %91 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !20, !amdgpu.noclobber !5
  %92 = zext i8 %91 to i32
  %93 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %92
  %94 = atomicrmw add i32 addrspace(3)* %93, i32 1 syncscope("agent-one-as") monotonic, align 4
  %95 = or i32 %40, 6
  %96 = mul nsw i32 %95, %21
  %97 = add i32 %34, %96
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %98
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !20, !amdgpu.noclobber !5
  %101 = zext i8 %100 to i32
  %102 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %101
  %103 = atomicrmw add i32 addrspace(3)* %102, i32 1 syncscope("agent-one-as") monotonic, align 4
  %104 = or i32 %40, 7
  %105 = mul nsw i32 %104, %21
  %106 = add i32 %34, %105
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %107
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !20, !amdgpu.noclobber !5
  %110 = zext i8 %109 to i32
  %111 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %110
  %112 = atomicrmw add i32 addrspace(3)* %111, i32 1 syncscope("agent-one-as") monotonic, align 4
  %113 = add nuw nsw i32 %40, 8
  %114 = add i32 %41, 8
  %115 = icmp eq i32 %114, %38
  br i1 %115, label %116, label %39, !llvm.loop !21

116:                                              ; preds = %39, %33
  %117 = phi i32 [ 0, %33 ], [ %113, %39 ]
  %118 = icmp eq i32 %35, 0
  br i1 %118, label %133, label %119

119:                                              ; preds = %116, %119
  %120 = phi i32 [ %130, %119 ], [ %117, %116 ]
  %121 = phi i32 [ %131, %119 ], [ 0, %116 ]
  %122 = mul nsw i32 %120, %21
  %123 = add i32 %34, %122
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %124
  %126 = load i8, i8 addrspace(1)* %125, align 1, !tbaa !20, !amdgpu.noclobber !5
  %127 = zext i8 %126 to i32
  %128 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %127
  %129 = atomicrmw add i32 addrspace(3)* %128, i32 1 syncscope("agent-one-as") monotonic, align 4
  %130 = add nuw nsw i32 %120, 1
  %131 = add i32 %121, 1
  %132 = icmp eq i32 %131, %35
  br i1 %132, label %133, label %119, !llvm.loop !23

133:                                              ; preds = %116, %119, %25
  %134 = phi i32 [ 0, %25 ], [ %29, %119 ], [ %29, %116 ]
  %135 = icmp ne i32 %31, 0
  %136 = icmp slt i32 %15, %31
  %137 = select i1 %135, i1 %136, i1 false
  br i1 %137, label %138, label %148

138:                                              ; preds = %133
  %139 = mul nsw i32 %134, %21
  %140 = add i32 %15, %1
  %141 = add i32 %140, %139
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %142
  %144 = load i8, i8 addrspace(1)* %143, align 1, !tbaa !20, !amdgpu.noclobber !5
  %145 = zext i8 %144 to i32
  %146 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %145
  %147 = atomicrmw add i32 addrspace(3)* %146, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %148

148:                                              ; preds = %138, %133
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %22, label %149, label %155

149:                                              ; preds = %148
  %150 = zext i32 %14 to i64
  %151 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(1)* @glb_hist, i64 0, i64 %150
  %152 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ14calc_histogramPhiiE4hist, i32 0, i32 %14
  %153 = load i32, i32 addrspace(3)* %152, align 4, !tbaa !16
  %154 = atomicrmw add i32 addrspace(1)* %151, i32 %153 syncscope("agent-one-as") monotonic, align 4
  br label %155

155:                                              ; preds = %149, %148
  ret void
}

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z14calc_histogramPiPhii(i32 addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 2, !range !4, !invariant.load !5
  %19 = zext i16 %18 to i32
  %20 = mul i32 %15, %19
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !15
  %22 = add i32 %20, %21
  %23 = udiv i32 %13, %10
  %24 = mul i32 %23, %10
  %25 = icmp ugt i32 %13, %24
  %26 = zext i1 %25 to i32
  %27 = add i32 %23, %26
  %28 = mul i32 %27, %22
  %29 = add i32 %28, %5
  %30 = mul i32 %29, %10
  %31 = add i32 %30, %14
  %32 = icmp slt i32 %31, %3
  br i1 %32, label %33, label %36

33:                                               ; preds = %4
  %34 = sext i32 %31 to i64
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %34
  store i32 0, i32 addrspace(1)* %35, align 4, !tbaa !16
  br label %36

36:                                               ; preds = %33, %4
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %37 = icmp slt i32 %31, %2
  br i1 %37, label %38, label %45

38:                                               ; preds = %36
  %39 = sext i32 %31 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !20
  %42 = zext i8 %41 to i64
  %43 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %42
  %44 = atomicrmw add i32 addrspace(1)* %43, i32 1 syncscope("agent-one-as") monotonic, align 4
  br label %45

45:                                               ; preds = %38, %36
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!18, !18, i64 0}
!21 = distinct !{!21, !22}
!22 = !{!"llvm.loop.mustprogress"}
!23 = distinct !{!23, !24}
!24 = !{!"llvm.loop.unroll.disable"}
